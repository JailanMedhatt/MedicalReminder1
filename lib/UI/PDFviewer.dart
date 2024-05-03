import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PdfViewerScreen extends StatefulWidget {
  final String pdfUrl;

  const PdfViewerScreen({super.key, required this.pdfUrl});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  PDFDocument? document;

  void intializePdf() async {
    document = await PDFDocument.fromURL(widget.pdfUrl);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    intializePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: document != null
          ? PDFViewer(
              document: document!,
              showNavigation: true,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

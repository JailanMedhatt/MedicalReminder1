

import 'package:finalproject1/Security.dart';
import 'package:finalproject1/UI/PDFviewer.dart';
import 'package:flutter/material.dart';

class PdfGridView extends StatelessWidget {
  List <Map<String, dynamic>>? pdfData;
  PdfGridView({required this.pdfData});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          // Adjust the spacing between columns
          mainAxisSpacing:
          10, // Adjust the spacing between rows
        ),
        padding: EdgeInsets.all(10),
        // shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: pdfData?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            PdfViewerScreen(
                                pdfUrl: Security.decryptData(
                                    pdfData?[
                                    index]
                                    [
                                    'url']))),
                  );
                },
                child: Material(
                  color: Colors.transparent,
                  elevation: 20.0,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(
                            20),
                        color: Color(0xffEDF2F3),
                      ),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/images/download.png",
                            height: 120,
                            width: 100,
                            alignment:
                            Alignment.center,
                          ),
                          Expanded(
                            child: Text(
                              Security.decryptData(
                                  pdfData?[
                                  index]
                                  ['name']),
                              textAlign: TextAlign
                                  .center,
                              style: TextStyle(
                                  color: Colors
                                      .black,
                                  fontSize: 18,
                                  fontWeight:
                                  FontWeight
                                      .bold),
                            ),
                          ),
                        ],
                      )),
                )),
          );
        });
  }
}

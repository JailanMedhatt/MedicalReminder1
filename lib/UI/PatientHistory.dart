import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:finalproject1/FireBase/FirebaseUtills.dart';
import 'package:finalproject1/UI/PDFviewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:standard_searchbar/new/standard_search_anchor.dart';
import 'package:standard_searchbar/new/standard_search_bar.dart';
import 'package:standard_searchbar/new/standard_suggestion.dart';
import 'package:standard_searchbar/new/standard_suggestions.dart';

class PatientHistory extends StatefulWidget {
  static final String routeName = "PatientHistory";

  @override
  State<PatientHistory> createState() => _PatientHistoryState();
}

class _PatientHistoryState extends State<PatientHistory> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> pdfData = [];

  void pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (pickedFile != null) {
      String fileName = pickedFile.files[0].name;
      File file = File(pickedFile.files[0].path!);
      final downloadLink = await UploadPdfs.uploadPdf(fileName, file);

      await _firebaseFirestore.collection("pdfs").add({
        "name": fileName,
        "url": downloadLink,
      });

      print("Pdf uploaded successfully");
    }
  }

  void getAllPdf() async {
    final results = await _firebaseFirestore.collection("pdfs").get();
    pdfData = results.docs.map((e) => e.data()).toList();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllPdf();
  }

  // List suggestions=[];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Opening.png"),
            fit: BoxFit.cover,
          ),
        )),
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, size: 32)),
            title: Text(
              'Patient History',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 125),
                child: SizedBox(
                    width: 360,
                    child: StandardSearchAnchor(
                      searchBar: StandardSearchBar(
                        bgColor: Colors.white,
                      ),
                      suggestions: StandardSuggestions(
                        suggestions: [
                          StandardSuggestion(text: 'Suggestion 1'),
                          StandardSuggestion(text: 'Suggestion 2'),
                          StandardSuggestion(text: 'Suggestion 3'),
                        ],
                      ),
                    )),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: pdfData.length,
                    itemBuilder: (context, index) {
                      Padding(
                        padding:
                            EdgeInsets.only(left: 15.0, top: 20, right: 15.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 20.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffEDF2F3),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PdfViewerScreen(
                                        pdfUrl: pdfData[index]['url'])));
                                //
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.0,
                                        top: 16,
                                        bottom: 16,
                                        right: 16),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/image 9.png")),
                                  ),
                                  Column(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        pdfData[index]['name'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Type what you want to remember',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context, "Note");
                                          },
                                          child: Icon(
                                            Icons.edit_note,
                                            size: 40,
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
          // Column(
          //  children: [
          //    SizedBox(height: 50),
          //    Padding(
          //      padding:  EdgeInsets.only(left: 15),
          //      child: SizedBox(
          //          width: 360,
          //          child: StandardSearchAnchor(
          //            searchBar: StandardSearchBar(
          //              bgColor: Colors.white,
          //            ),
          //            suggestions: StandardSuggestions(
          //              suggestions: [
          //                StandardSuggestion(text: 'Suggestion 1'),
          //                StandardSuggestion(text: 'Suggestion 2'),
          //                StandardSuggestion(text: 'Suggestion 3'),
          //              ],
          //            ),
          //          )),
          //    ),
        ),

        ///Floating button
        //Spacer(),

        Padding(
          padding: const EdgeInsets.only(left: 300, top: 670),
          child: FloatingActionButton(
            elevation: 25.0,
            onPressed: pickFile,
            backgroundColor: Color(0xffEDF2F3),
            child: Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Icon(
                CupertinoIcons.cloud_upload,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

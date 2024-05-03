import 'package:finalproject1/Security.dart';
import 'package:finalproject1/UI/PDFviewer.dart';
import 'package:finalproject1/ViewModels/Profile/ProfileStates.dart';
import 'package:finalproject1/ViewModels/patientHistory/PatientHistoryStates.dart';
import 'package:finalproject1/ViewModels/patientHistory/PatientHistoryViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:standard_searchbar/new/standard_search_anchor.dart';
import 'package:standard_searchbar/new/standard_search_bar.dart';
import 'package:standard_searchbar/new/standard_suggestion.dart';
import 'package:standard_searchbar/new/standard_suggestions.dart';

class PatientHistory extends StatelessWidget {
  static final String routeName = "PatientHistory";

  PatientHistoryViewModel viewModel = PatientHistoryViewModel();

  // @override
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
                              Navigator.pushNamed(context, "Note");
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Personal notes",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Type what you want to remember',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Icon(
                                  Icons.edit_note,
                                  size: 40,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                         Expanded(
                           child: BlocBuilder<PatientHistoryViewModel,
                                      PatientHistoryStates>(
                                  bloc: viewModel..getAllPdf(),
                                  builder: (context, state) {
                                    if(state is LoadingHistory){
                                      return Center(child: CircularProgressIndicator());
                                    }
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
                                        itemCount: viewModel.pdfData?.length ?? 0,
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
                                                                    viewModel.pdfData?[
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
                                                                  viewModel.pdfData?[
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
                                  }),
                         ),

                  ],
                ),
              ),

              ///Floating button

              Padding(
                padding: const EdgeInsets.only(left: 300, top: 670),
                child: FloatingActionButton(
                  elevation: 25.0,
                  onPressed: viewModel.pickFile,
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

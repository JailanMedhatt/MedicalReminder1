import 'package:finalproject1/CustomWidgets/PdfGridView.dart';
import 'package:finalproject1/ViewModels/patientHistory/PatientHistoryStates.dart';
import 'package:finalproject1/ViewModels/patientHistory/PatientHistoryViewModel.dart';
import 'package:finalproject1/myTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../providers/list_provider.dart';
class PatientHistory extends StatelessWidget {
  static final String routeName = "PatientHistory";
  String query="";

  PatientHistoryViewModel viewModel = PatientHistoryViewModel();
  // @override
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);

          return Stack(
            children: [
              Container(
                  decoration:  BoxDecoration(
                image: listProvider.getBackgroundImage(),
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
                  title: Text(AppLocalizations.of(context)!.patient_History,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                  ),
                ),
                body: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 18.w, top: 100.h,right: 18.w),
                      child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search), hintText: AppLocalizations.of(context)!.search,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: listProvider.isDarkMode()?
                              MyTheme.whiteColor
                                  :
                              Colors.white)
                            ),fillColor: listProvider.isDarkMode()?
                              MyTheme.backgroundDark
                              :
                          Colors.white,
                            filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(color: Colors.white)
                              )
                          ),
                          onChanged: (val) {

                              query = val;
                               viewModel.Search(query);

                          }
                      )

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
                            color: listProvider.isDarkMode()?
                                MyTheme.n
                            :

                            Color(0xffEDF2F3),
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
                                      AppLocalizations.of(context)!.personal_Notes,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.word_in_personal_note,
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
                                    if(state is SearchHistory){
                                    return PdfGridView(pdfData: state.searchedpdfData);
                                    }
                                    return PdfGridView(pdfData: viewModel.pdfData);
                                  }),
                         ),

                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 300, top: 670),
                child: FloatingActionButton(
                  elevation: 25.0,
                  onPressed: viewModel.pickFile,
                  backgroundColor: listProvider.isDarkMode()?
                      MyTheme.icondark
                      :
                  Color(0xffEDF2F3),
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

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:finalproject1/FireBase/FirebaseUtills.dart';
import 'package:finalproject1/Security.dart';
import 'package:finalproject1/SharedPref.dart';
import 'package:finalproject1/ViewModels/patientHistory/PatientHistoryStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientHistoryViewModel extends Cubit<PatientHistoryStates>{
  PatientHistoryViewModel():super(LoadingHistory());
  List <Map<String, dynamic>>? pdfData = [];
  List <Map<String, dynamic>>? searchedpdfData = [];

  String id = SharedPref.getId();


  void pickFile() async {

    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    emit(LoadingHistory());
    if (pickedFile != null) {
      String fileName = pickedFile.files[0].name;
      File file = File(pickedFile.files[0].path!);
      final downloadLink = await UploadPdfs.uploadPdf(fileName, file);
      String encFileName= Security.encryptData(fileName);
      String encDownloadLink= Security.encryptData(downloadLink);

      await FireBaseUtills.getUserCollectionRef().doc(id).collection("pdfs").add({
        "name": encFileName,
        "url": encDownloadLink,
      });

      print("Pdf uploaded successfully");
    }
    getAllPdf();
  }

  void getAllPdf() async {


    pdfData=null;


    final results = await FireBaseUtills.getUserCollectionRef().doc(id).collection("pdfs").get();
    pdfData = results.docs.map((e) => e.data()).toList();
   if(pdfData!=null) {
   emit(ListLoadedHistory());
   }

  }
  void Search(String query){

    searchedpdfData = [];
     for(int i=0;i<pdfData!.length ;i++){
       if(Security.decryptData(pdfData![i]['name']).toString().toLowerCase().startsWith(query)){
         searchedpdfData?.add(pdfData![i]);
       }
     }
    emit(SearchHistory(searchedpdfData: searchedpdfData));

    print(query +searchedpdfData!.length.toString()??"");

  }
}
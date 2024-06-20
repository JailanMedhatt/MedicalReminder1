import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../FireBase/FirebaseUtills.dart';
import '../FireBase/Models/Medicine.dart';

class ReminderListProvider extends ChangeNotifier{
  List<Medicine> MedicineList =[];
  DateTime selectDate = DateTime.now();

  void getAllMedicinesFromFireStore(String uId) async {
    QuerySnapshot<Medicine> querySnapshot =await FireBaseUtills.getMedicineCollection(uId).get();
    MedicineList = querySnapshot.docs.map((doc){
      return doc.data();

    }).toList();
    //// filtering list
   MedicineList = MedicineList.where((medicine) {
      if (medicine.time?.day == selectDate.day &&
          medicine.time?.month == selectDate.month &&
          medicine.time?.year == selectDate.year) {
        return true;
      }
      return false;
    }).toList();

    /// sorting
    MedicineList.sort((Medicine medicine1, Medicine medicine2) {
      return medicine1.time!.compareTo(medicine2.time!);
    });

    notifyListeners();

  }
  void changeSelectDate(DateTime newDate, String uId) {
    selectDate = newDate;
 getAllMedicinesFromFireStore(uId);
  }

}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../FireBase/FirebaseUtills.dart';
import '../FireBase/Models/Medicine.dart';

class ReminderListProvider extends ChangeNotifier{
  List<Medicine> MedicineList =[];

  void getAllMedicinesFromFireStore() async {
    QuerySnapshot<Medicine> querySnapshot =await FireBaseUtills.getMedicineCollection().get();
    MedicineList = querySnapshot.docs.map((doc){
      return doc.data();

    }).toList();
    notifyListeners();
  }

}
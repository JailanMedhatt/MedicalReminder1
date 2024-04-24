import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../FireBase/FirebaseUtills.dart';
import '../FireBase/Models/UserAppointment.dart';

class ListProvider extends ChangeNotifier{
  List<Appointment> appointmentList = [];
  void getAppointmentsFromFireStore()async{
    QuerySnapshot<Appointment> querySnapshot= await FireBaseUtillsAppointment.getAppointmentCollection().get();
    appointmentList = querySnapshot.docs.map((doc) {
      return doc.data();

    }).toList();
   notifyListeners();
  }

  ThemeMode appTheme = ThemeMode.light;

  void changeTheme (ThemeMode newMode){
  //   if(appTheme == newMode){
  //     return;
  //   }
  //   appTheme=newMode;
  //   notifyListeners();
  // }
    if (appTheme == ThemeMode.light) {
      appTheme = ThemeMode.dark;
    } else {
      appTheme = ThemeMode.light;
    }
    notifyListeners();
  }
  bool isDarkMode(){
    return appTheme == ThemeMode.dark;

  }
  DecorationImage getBackgroundImage() {
    if (appTheme == ThemeMode.dark) {
      return DecorationImage(
        image: AssetImage("assets/images/darkBk.png"),
        fit: BoxFit.cover,
      );
    } else {
      return DecorationImage(
        image: AssetImage("assets/images/bk.png"),
        fit: BoxFit.cover,
      );
    }
  }
}
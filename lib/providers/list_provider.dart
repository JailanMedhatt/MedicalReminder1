import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject1/FireBase/Models/Medicine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../FireBase/FirebaseUtills.dart';
import '../FireBase/Models/UserAppointment.dart';
class ListProvider extends ChangeNotifier {

  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;
  //List<MissedMedicine> missedMedicines = [];


  void changeTheme(ThemeMode newMode) {
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

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  void changeLanguage(String newLanguage) {
    if (appLanguage == 'en') {
      appLanguage = 'ar';
    }
    else {
      appLanguage = 'en';
    }
    notifyListeners();
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

///mn henaaaaaaaa
//   void addMissedMedicine(String day, String name) {
//     missedMedicines.add(MissedMedicine(day: day, name: name));
//     notifyListeners();
//     //_sendNotification(name);
//   }
//
//   // Future<void> _sendNotification(String medicineName) async {
//   //   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   //   try {
//   //     await messaging.subscribeToTopic('missed_medicines');
//   //     await FirebaseMessaging.instance.sendMessage(
//   //       topic: 'missed_medicines',
//   //       data: {
//   //         'title': 'Missed Medicine',
//   //         'body': 'You missed a dose of $medicineName',
//   //       },
//   //     );
//   //   } catch (e) {
//   //     print('Error sending notification: $e');
//   //   }
//   // }
// }
//
// class MissedMedicine {
//   final String day;
//   final String name;
//
//   MissedMedicine({required this.day, required this.name});
// }

}
class AppointmentProvider extends ChangeNotifier{
  List<Appointment> appointmentList = [];
  DateTime selectDate = DateTime.now();
   bool isDone = false;
  void getAppointmentsFromFireStore(String Id)async{
    QuerySnapshot<Appointment> querySnapshot= await FireBaseUtills.getAppointmentCollection(Id).get();
    appointmentList = querySnapshot.docs.map((doc) {
      return doc.data();

    }).toList();

    appointmentList = appointmentList.where((element) {
      if(selectDate.day==element.dateTime?.day &&
          selectDate.month == element.dateTime?.month &&
          selectDate.year == element.dateTime?.year
      ){
        return true;}
      return false;
    }).toList();

    notifyListeners();
  }
  changeSelectDate(DateTime newSelectDate, String Id){
    selectDate = newSelectDate;
    getAppointmentsFromFireStore(Id);
  }

}
class MedicineProvider extends ChangeNotifier{
  List<Medicine> medicineList = [];
  DateTime selectDate = DateTime.now();
  bool isDone = false;
  void getMedicinesFromFireStore(String Id)async{
    QuerySnapshot<Medicine> querySnapshot= await FireBaseUtills.getMedicineCollection(Id).get();
   medicineList = querySnapshot.docs.map((doc) {
      return doc.data();

    }).toList();

    medicineList = medicineList.where((element) {
      if(selectDate.day==element.time?.day &&
          selectDate.month == element.time?.month &&
          selectDate.year == element.time?.year
      ){
        return true;}
      return false;
    }).toList();

    notifyListeners();
  }
  changeSelectDate(DateTime newSelectDate, String Id){
    selectDate = newSelectDate;
    getMedicinesFromFireStore(Id);
  }

}


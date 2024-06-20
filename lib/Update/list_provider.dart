import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ListProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;
  List<MissedMedicine> missedMedicines = [];

  void changeTheme(ThemeMode newMode) {
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
    } else {
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

  void addMissedMedicine(String day, String name) {
    missedMedicines.add(MissedMedicine(day: day, name: name));
    notifyListeners();
    _sendNotification(name);
  }

  Future<void> _sendNotification(String medicineName) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    try {
      await messaging.subscribeToTopic('missed_medicines');
      await FirebaseMessaging.instance.sendMessage(
        topic: 'missed_medicines',
        data: {
          'title': 'Missed Medicine',
          'body': 'You missed a dose of $medicineName',
        },
      );
    } catch (e) {
      print('Error sending notification: $e');
    }
  }
}

class MissedMedicine {
  final String day;
  final String name;

  MissedMedicine({required this.day, required this.name});
}

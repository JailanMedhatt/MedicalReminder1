import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier{
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
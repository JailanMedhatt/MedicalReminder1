import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier{
  ThemeMode appTheme = ThemeMode.dark;

  void changeTheme (ThemeMode newMode){
    if(appTheme == newMode){
      return;
    }
    appTheme=newMode;
    notifyListeners();
  }
  bool isDarkMode(){
    return appTheme == ThemeMode.dark;
  }
}


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTheme{
  static Color backgroundLight = Color(0xffF9FFFF);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color blackColor = Color(0xff000000);
  static Color primaryColor = Color(0xff515796);
  static Color greyColor  = Color(0xff887E7E);
  static Color darkPurple = Color(0xff444972);
  static Color backgroundDark = Color(0xff101835);
  static Color primaryDark = Color(0xffEBE9E9);
  static Color p = Color(0xff535a9e);//0xff5D65B0
  static Color p2 = Color(0xff5a5e7e);
  static Color r = Color(0x705d65b0);
  static Color i = Color(0xffa1a8e5);
  static Color iconlight = Color(0xff5D65B0);
  static Color icondark = Color(0xff9acbf5);
  static Color n = Color(0xff7e81a1);


  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundLight,
    colorScheme: ColorScheme.light(
      primary: p,
      secondary: p2,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(14),
      ),

    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleMedium: TextStyle(
         color: whiteColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      titleSmall:TextStyle(
        color: greyColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),


  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: backgroundDark,
    colorScheme: ColorScheme.dark(
      primary: backgroundDark,
      secondary: darkPurple,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryDark,
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(14),
      ),

    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleMedium: TextStyle(
        color: whiteColor,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      titleSmall:TextStyle(
        color: greyColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),


  );


}

import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Color.fromARGB(255,0,20,64) : Colors.white70,

      backgroundColor: isDarkTheme ? Color.fromARGB(255,0,20,64) : Color.fromRGBO(254, 244, 255, 1),

      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),

      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),

      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),

      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      textSelectionTheme: TextSelectionThemeData(selectionColor:isDarkTheme ? Colors.white : Colors.black ) ,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Color.fromARGB(255,0,20,64) : Color.fromRGBO(254, 244, 255, 1),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),

      bottomAppBarTheme: BottomAppBarTheme(
        color:isDarkTheme ? Color.fromARGB(255,0,20,64) : Color.fromRGBO(254, 244, 255, 1),

      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color:isDarkTheme ? Colors.white70  : Colors.deepPurple,),
        backgroundColor: isDarkTheme ? Color.fromARGB(255,0,20,64) : Color.fromRGBO(254, 244, 255, 1),

      ),
      iconTheme: IconThemeData(
        color: isDarkTheme ? Colors.white70 : Colors.deepPurple,

      ),

    );

  }
}
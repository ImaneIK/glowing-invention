import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(

        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 40, color: isDarkTheme ? Colors.white70 : Color.fromRGBO(4, 20, 244,1)),
          displayMedium: TextStyle(fontSize: 30,color: isDarkTheme ? Colors.white70 : Color.fromRGBO(4, 20, 244,1)),
          displaySmall: TextStyle(fontSize: 25,color: isDarkTheme ? Colors.white70 : Color.fromRGBO(4, 20, 244,1)),
          titleLarge: TextStyle(fontSize: 20,color: isDarkTheme ? Colors.white70 : Color.fromRGBO(4, 20, 244,1) , fontWeight: FontWeight.w400),
          titleMedium: TextStyle(fontSize: 13,color: isDarkTheme ? Colors.white70 : Color.fromRGBO(4, 20, 244,1)),
          titleSmall: TextStyle(fontSize: 10,color: isDarkTheme ? Colors.white70 : Color.fromRGBO(4, 20, 244,1)),
        ).apply(
        bodyColor: isDarkTheme ? Colors.white70 : Color.fromRGBO(0, 13, 198,1),
        displayColor: isDarkTheme ? Colors.white70 : Color.fromRGBO(0, 13, 198,1),
        ),


      listTileTheme: ListTileThemeData(
        selectedColor:isDarkTheme ? Colors.white70 : Color.fromRGBO(0, 13, 198,1),
        textColor: isDarkTheme ? Colors.white70 : Color.fromRGBO(0, 13, 198,1),
        iconColor: isDarkTheme ? Colors.white70 : Color.fromRGBO(0, 13, 198,1),
      ),

     // primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Color.fromARGB(255,0,20,64) : Colors.white70,


      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(isDarkTheme ? Colors.white24 :Colors.white70),
      ),



      inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: isDarkTheme ? Colors.white70 : Color.fromRGBO(0, 23, 114,1),),
          prefixIconColor: isDarkTheme ? Colors.white70 : Color.fromRGBO(0, 23, 114,1),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide:
            BorderSide(color: isDarkTheme ? Colors.white70 : Color.fromRGBO(0, 23, 114, 1)),
          ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: isDarkTheme ? Colors.white70 : Color.fromRGBO(0, 23, 114, 1) )),
          labelStyle: TextStyle(color: isDarkTheme ? Colors.white70 : Color.fromRGBO(0, 23, 114, 1))),


      backgroundColor: isDarkTheme ? Color.fromARGB(255,0,20,64) : Color.fromRGBO(254, 244, 255, 1),

      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),

      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),

      highlightColor: isDarkTheme ? Color(0xff372901) : Color.fromRGBO(0, 13, 198,1),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),

      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      textSelectionTheme: TextSelectionThemeData(selectionColor:isDarkTheme ? Colors.white : Colors.deepPurpleAccent ) ,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Color.fromARGB(255,0,20,64) : Color.fromRGBO(254, 244, 255, 1),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),

      bottomAppBarTheme: BottomAppBarTheme(
        color:isDarkTheme ? Color.fromARGB(255,0,20,64) : Color.fromRGBO(254, 244, 255, 1),

      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: isDarkTheme ? Colors.white70  : Colors.deepPurple,
        ),
        titleTextStyle: TextStyle(color:isDarkTheme ? Colors.white70  : Colors.deepPurple,),
        backgroundColor: isDarkTheme ? Color.fromARGB(255,0,20,64) : Color.fromRGBO(254, 244, 255, 1),

      ),
      iconTheme: IconThemeData(
        color: isDarkTheme ? Colors.white70 : Color.fromRGBO(0, 13, 198,1),

      ),

    );

  }
}
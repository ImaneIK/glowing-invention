import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      textTheme: TextTheme(
        displayLarge: TextStyle(
            fontSize: 40,
            color:
                isDarkTheme ? Colors.white70 : const Color.fromRGBO(4, 20, 244, 1)),
        displayMedium: TextStyle(
            fontSize: 30,
            color:
                isDarkTheme ? Colors.white70 : const Color.fromRGBO(4, 20, 244, 1)),
        displaySmall: TextStyle(
            fontSize: 25,
            color:
                isDarkTheme ? Colors.white70 : const Color.fromRGBO(4, 20, 244, 1)),
        titleLarge: TextStyle(
            fontSize: 20,
            color: isDarkTheme ? Colors.white70 : const Color.fromRGBO(4, 20, 244, 1),
            fontWeight: FontWeight.w400),
        titleMedium: TextStyle(
            fontSize: 13,
            color:
                isDarkTheme ? Colors.white70 : const Color.fromRGBO(4, 20, 244, 1)),
        titleSmall: TextStyle(
            fontSize: 10,
            color:
                isDarkTheme ? Colors.white70 : const Color.fromRGBO(4, 20, 244, 1)),
      ).apply(
        bodyColor:
            isDarkTheme ? Colors.white70 : const Color.fromRGBO(0, 13, 198, 1),
        displayColor:
            isDarkTheme ? Colors.white70 : const Color.fromRGBO(0, 13, 198, 1),
      ),

      listTileTheme: ListTileThemeData(
        selectedColor:
            isDarkTheme ? Colors.white70 : const Color.fromRGBO(0, 13, 198, 1),
        textColor:
            isDarkTheme ? Colors.white70 : const Color.fromRGBO(0, 13, 198, 1),
        iconColor:
            isDarkTheme ? Colors.white70 : const Color.fromRGBO(0, 13, 198, 1),
      ),

      // primarySwatch: Colors.red,
      primaryColor:
          isDarkTheme ? const Color.fromARGB(255, 0, 20, 64) : Colors.white70,

      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(
            isDarkTheme ? Colors.white38 : Colors.white70),
      ),

      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: isDarkTheme
                ? Colors.white70
                : const Color.fromRGBO(4, 20, 244, 1),
          ),
          prefixIconColor: isDarkTheme
              ? Colors.white70
              : const Color.fromRGBO(4, 20, 244, 1),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Color.fromRGBO(4, 20, 244, 1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
                color: isDarkTheme
                    ? Colors.white70
                    : const Color.fromRGBO(4, 20, 244, 1)),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                  color: isDarkTheme
                      ? Colors.white70
                      : const Color.fromRGBO(4, 20, 244, 1))),
          labelStyle: TextStyle(
              color: isDarkTheme
                  ? Colors.white70
                  : const Color.fromRGBO(4, 20, 244, 1))),

      backgroundColor: isDarkTheme
          ? const Color.fromARGB(255, 0, 20, 64)
          : const Color.fromRGBO(254, 244, 255, 1),

      indicatorColor:
          isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
      buttonColor:
          isDarkTheme ? const Color(0xff3B3B3B) : const Color(0xffF1F5FB),

      hintColor:
          isDarkTheme ? const Color(0xff280C0B) : const Color(0xffEECED3),

      highlightColor: isDarkTheme
          ? const Color(0xff372901)
          : const Color.fromRGBO(0, 13, 198, 1),
      hoverColor:
          isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),

      focusColor:
          isDarkTheme ? const Color(0xff0B2512) : Color.fromRGBO(0, 13, 198, 1),
      disabledColor: Colors.grey,
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: isDarkTheme ? Colors.white : Colors.deepPurpleAccent),
      cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme
          ? const Color.fromARGB(255, 0, 20, 64)
          : const Color.fromRGBO(254, 244, 255, 1),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),

      bottomAppBarTheme: BottomAppBarTheme(
        color: isDarkTheme
            ? const Color.fromARGB(255, 0, 20, 64)
            : const Color.fromRGBO(254, 244, 255, 1),
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: isDarkTheme
              ? Colors.white70
              : const Color.fromRGBO(4, 20, 244, 1),
        ),
        titleTextStyle: TextStyle(
          color: isDarkTheme
              ? Colors.white70
              : const Color.fromRGBO(4, 20, 244, 1),
        ),
        backgroundColor: isDarkTheme
            ? const Color.fromARGB(255, 0, 20, 64)
            : const Color.fromRGBO(254, 244, 255, 1),
      ),
      iconTheme: IconThemeData(
        color:
            isDarkTheme ? Colors.white70 : const Color.fromRGBO(0, 13, 198, 1),
      ),
    );
  }
}

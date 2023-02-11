
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../DarkMode/DarkThemeProvider.dart';

class ThemeSwitch extends StatefulWidget {

   ThemeSwitch({Key? key}) : super(key: key);

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Switch(
        value: themeChange.darkTheme,
        onChanged: (bool value) {  themeChange.darkTheme = value;}
    );

  }
}




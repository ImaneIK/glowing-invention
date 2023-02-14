import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../DarkMode/DarkThemeProvider.dart';
import '../Widgets/theme_switch.dart';

class DarkMode extends StatelessWidget {
  static const keyDarkMode = 'key-dark-mode';

  const DarkMode({super.key});

  @override
  Widget build(BuildContext context) {
    var object = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(222, 248, 255, 0.95),
                Color.fromRGBO(222, 248, 255, 0.4)
              ]),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(object ? 'Dark Mode' : 'Light Mode'),
        subtitle: const Text(''),
        leading: const Icon(
          Icons.power_settings_new,
        ),
        trailing: ThemeSwitch(),
      ),
    );
  }
}

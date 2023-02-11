import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../DarkMode/DarkThemeProvider.dart';
import '../Widgets/theme_switch.dart';

class DarkMode extends StatelessWidget {
  static const keyDarkMode = 'key-dark-mode';

  @override
  Widget build(BuildContext context) {
    var object = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color.fromRGBO(222,248,255,0.95), const Color.fromRGBO(222,248,255,0.4)]
            ),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(object ? 'Dark Mode':'Light Mode' ),
          subtitle: Text(''),
          leading: const Icon(
            Icons.power_settings_new,
          ),
          trailing: ThemeSwitch(),

          ),
        );
  }
}

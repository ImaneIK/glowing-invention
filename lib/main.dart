import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lumosmaxima/splash_screen.dart';
import 'package:lumosmaxima/views/dashboard.dart';
import 'package:lumosmaxima/views/devices/LampPage.dart';
import 'package:lumosmaxima/views/devices/MVPage.dart';
import 'package:lumosmaxima/views/devices/ac.dart';
import 'package:lumosmaxima/views/settings.dart';
import 'package:provider/provider.dart';
import 'DarkMode/DarkThemeProvider.dart';
import 'DarkMode/dark_theme_styles.dart';
import 'HomePage.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late DarkThemeProvider themeChangeProvider;

  @override
  void initState() {
    super.initState();
    themeChangeProvider = DarkThemeProvider();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => themeChangeProvider,
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeChangeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: AnimatedSplashScreen(
              splash: 'smart-home.png',
              duration: 1000,
              nextScreen: LoginScreen(),
              splashTransition: SplashTransition.fadeTransition,
              splashIconSize: 200,
            ),
          );
        },
      ),
    );
  }
}

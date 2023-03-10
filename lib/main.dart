import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DarkMode/DarkThemeProvider.dart';
import 'DarkMode/dark_theme_styles.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
              nextScreen: const LoginScreen(),
              splashTransition: SplashTransition.fadeTransition,
              splashIconSize: 200,
            ),
          );
        },
      ),
    );
  }
}

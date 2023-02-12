import 'package:flutter/material.dart';
import 'package:lumosmaxima/views/appliance.dart';
import 'package:lumosmaxima/views/dashboard.dart';
import 'package:lumosmaxima/views/notifications.dart';
import 'package:lumosmaxima/views/settings.dart';
import 'package:provider/provider.dart';

import 'DarkMode/DarkThemeProvider.dart';

var section = "devices";

class Routing extends StatefulWidget {
  @override
  State<Routing> createState() => _RoutingState();
}

class _RoutingState extends State<Routing> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  int pageIndex = 0;
  var pages = [Dashboard(), Appliance(), Notifications(), Settings()];

  Widget MyTile(icon, text, index) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(text,
          style: const TextStyle(fontSize: 20.0, color: Colors.deepPurple)),
      trailing: const Icon(
        Icons.arrow_right,
        color: Colors.deepPurple,
      ),
      onTap: () {
        _onItemTapped(index);
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => pages[index]));
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          extendBodyBehindAppBar: true,
          body: pages[pageIndex],
        ));
  }
}
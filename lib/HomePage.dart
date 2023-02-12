import 'package:flutter/material.dart';
import 'package:lumosmaxima/views/appliance.dart';
import 'package:lumosmaxima/views/dashboard.dart';
import 'package:lumosmaxima/views/notifications.dart';
import 'package:lumosmaxima/views/settings.dart';
import 'package:provider/provider.dart';

import 'DarkMode/DarkThemeProvider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
     Dashboard(),
     Appliance(),
     Notifications(),
     Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    var object = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Scaffold(

      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage( object ?  "assets/bg2.png"  : "assets/bg1.jpg"),
                fit: BoxFit.cover),
          ),
          child: pages[pageIndex]),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
       /*   borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),*/
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                Icons.dashboard,
              )
                  : const Icon(
                Icons.dashboard_outlined,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                Icons.devices,
              )
                  : const Icon(
                Icons.devices_outlined,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                Icons.notifications_active,
              )
                  : const Icon(
                Icons.notifications_active_outlined,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? const Icon(
                Icons.settings,
              )
                  : const Icon(
                Icons.settings_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

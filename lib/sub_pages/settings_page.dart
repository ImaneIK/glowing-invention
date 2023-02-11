import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../DarkMode/DarkThemeProvider.dart';
import '../main.dart';
import 'UserPage.dart';
import 'account_info.dart';
import 'darkMode.dart';
import 'logout.dart';



class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var object = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage( object ?  "assets/bg2.png"  : "assets/bg1.jpg"),
                fit: BoxFit.cover),
          ),
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              UserPage(),
              DarkMode(),
              buildAccountInfo(context),
            //  buildDeleteAccount(),
            //  buildReportBug(context),
            //  buildSendFeedback(context),
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()) );},
                  child: buildLogout()),
                  ]),
          ),
        );
  }
}



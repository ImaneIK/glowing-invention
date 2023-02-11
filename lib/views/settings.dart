import 'package:flutter/material.dart';
import '../sub_pages/settings_page.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  State<Settings> createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('App Settings'),

        ),
        body: SettingsPage()

    );

  }
}

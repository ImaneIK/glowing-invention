import 'package:flutter/material.dart';
import '../main.dart';
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
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title:
          Text("Settings", style: Theme.of(context).textTheme.titleLarge),
          leading: Icon(Icons.settings_rounded),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PopupMenuButton(

                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 0, child: Text("Settings")),
                    const PopupMenuItem(value: 1, child: Text("Logout"))
                  ],
                  onSelected: (int value) {
                    setState(() {
                      if (value == 0) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                      }
                    });
                  },
                  child: CircleAvatar(backgroundColor: Colors.transparent, backgroundImage: AssetImage("avatar.jpg"),)),
            )
          ],
        ),
        body: SettingsPage()

    );

  }
}

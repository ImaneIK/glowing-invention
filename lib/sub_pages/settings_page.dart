import 'package:flutter/material.dart';
import 'package:lumosmaxima/sub_pages/user_details.dart';
import 'package:lumosmaxima/sub_pages/users.dart';
import 'package:provider/provider.dart';

import '../DarkMode/DarkThemeProvider.dart';
import '../Widgets/glass.dart';
import '../Widgets/theme_switch.dart';
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
          image: DecorationImage(
              image: AssetImage(object ? "assets/bg2.png" : "assets/bg1.jpg"),
              fit: BoxFit.cover),
        ),
        child: ListView(padding: const EdgeInsets.all(10), children: [
          const SizedBox( height: 20,),
          myProfile(const UserDetails()),
          const SizedBox(height: 25,),
          settingTile("Appearance", "Make this app yours", Icons.brush_outlined,
              null, 10, 10, 0, 0),
          settingTile("Privacy", "Improve your privacy",
              Icons.privacy_tip_outlined, null, 0, 0, 0, 0),
          darkModeSettingTile(object ? "Dark Mode" : "Light Mode",
              object ? Icons.dark_mode : Icons.light_mode, 0, 0, 10, 10),
          const SizedBox(height: 20,),
          settingTile("Users", "Manage users", Icons.person_pin, const UserConf(), 10,
              10, 10, 10),
          const SizedBox(height: 20,),
          settingTile("About", "Learn more about us", Icons.info_outline, null,
              10, 10, 0, 0),
          settingTile("Send Feedback", "your suggestions are welcomed",
              Icons.feedback_outlined, null, 0, 0, 10, 10),
          const SizedBox(height: 20,),
          settingTile("Logout", "Sign out from the app", Icons.logout_outlined,
              buildLogout(), 10, 10, 10, 10),
        ]),
      ),
    );
  }

  Widget myProfile(route) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => route));
      },
      child: Container(
          height: 130,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(222, 248, 255, 0.8),
                    Color.fromRGBO(222, 248, 255, 0.2)
                  ]),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: ListTile(
              title: Text(
                'John Doe',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              subtitle: Text(
                'Admin',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage("avatar.png"),
              ),
                trailing: Icon(Icons.edit),
            ),
          )),
    );
  }

  Widget settingTile(
      name, role, icon, route, topRight, topLeft, bottomLeft, bottomRight) {
    return GlassMorphism(
      start: 0.1,
      end: 0.6,
      topRight: topRight,
      topLeft: topLeft,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
      blurx: 2,
      blury: 4,
      child: ListTile(
        leading: Icon(icon),
        trailing: Icon(Icons.chevron_right),
        title: Text(
          name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          role,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        selected: true,
        onTap: () {
          setState(() {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => route));
          });
        },
      ),
    );
  }

  Widget darkModeSettingTile(
      name, icon, topRight, topLeft, bottomLeft, bottomRight) {
    return GlassMorphism(
      start: 0.1,
      end: 0.6,
      topRight: topRight,
      topLeft: topLeft,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
      blurx: 2,
      blury: 4,
      child: ListTile(
        leading: Icon(icon),
        trailing: ThemeSwitch(),
        title: Text(
          name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          "Conserving Energy",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        selected: true,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lumosmaxima/sub_pages/user_details.dart';
import 'package:lumosmaxima/sub_pages/users.dart';
import 'package:provider/provider.dart';

import '../DarkMode/DarkThemeProvider.dart';
import '../Widgets/glass.dart';
import '../Widgets/theme_switch.dart';
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
              SizedBox(height: 10,),
              myProfile(UserDetails()),
              SizedBox(height: 20,),
              settingTile("Apparence","Make this app yours",Icons.brush_outlined,null,10,10,0,0),
              settingTile("Privacy","Lock the smart home app to improve your privacy",Icons.privacy_tip_outlined,null,0,0,0,0),
              darkModeSettingTile(object ? "Dark Mode" : "Light Mode",object ? Icons.dark_mode : Icons.light_mode,0,0,10,10),
              SizedBox(height: 10,),
              settingTile("Users","manage users",Icons.person_pin,UserConf(),10,10,10,10),
              SizedBox(height: 10,),
              settingTile("About","Learn more about the smart home app",Icons.info_outline,null,10,10,0,0),
              settingTile("Send Feedback","Let us know how we can make the app better",Icons.feedback_outlined,null,0,0,10,10),
              SizedBox(height: 10,),
              settingTile("Logout","Sign out from the app",Icons.logout_outlined,buildLogout(),10,10,10,10),

                  ]),
          ),
        );
  }



  Widget myProfile(route){
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => route) );
      },
      child: Container(
          height: 70,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color.fromRGBO(222,248,255,0.8), const Color.fromRGBO(222,248,255,0.2)]
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: ListTile(
              title: Text('John Doe'),
              subtitle: Text('Admin'),
              leading:  Icon(
                Icons.admin_panel_settings,
              ),

            ),
          )),
    );
  }


  Widget settingTile(name,role,icon,route,topRight,topLeft,bottomLeft,bottomRight){
    return Container(
      //margin: EdgeInsets.symmetric(vertical: 5,horizontal: 17),
      child: GlassMorphism(
        start: 0.1,
        end: 0.6,
        topRight:topRight,
        topLeft: topLeft,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
        blurx: 2,
        blury: 4,
        child: ListTile(

          leading: Icon(icon),
          trailing: Icon(Icons.chevron_right),
          title:  Text(
            name,
            textScaleFactor: 1,
          ),
          subtitle:  Text(role),
          selected: true,
         onTap: () {
            setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => route));
            });
          },
        ),
      ),
    );
  }


  Widget darkModeSettingTile(name,icon,topRight,topLeft,bottomLeft,bottomRight){
    return Container(
     // margin: EdgeInsets.symmetric(vertical: 5,horizontal: 17),
      child: GlassMorphism(
        start: 0.1,
        end: 0.6,
        topRight:topRight,
        topLeft: topLeft,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
        blurx: 2,
        blury: 4,
        child: ListTile(

          leading: Icon(icon),
          trailing: ThemeSwitch(),
          title:  Text(
            name,
            textScaleFactor: 1,
          ),
          subtitle:  Text("Conserving Energy"),
          selected: true,

        ),
      ),
    );
  }
}



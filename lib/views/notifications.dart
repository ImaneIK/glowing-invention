import 'package:flutter/material.dart';
import 'package:lumosmaxima/views/settings.dart';
import 'package:provider/provider.dart';
import '../DarkMode/DarkThemeProvider.dart';
import '../Widgets/glass.dart';
import '../main.dart';


class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);
  @override
  State<Notifications> createState() => _NotificationsState();
}
class _NotificationsState extends State<Notifications> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    var object = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title:
        Text("Notifications", style: Theme.of(context).textTheme.titleLarge),
        leading: Icon(Icons.notifications_active_outlined),
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
      //drawer: MyDrawer(navigatorKey),

      backgroundColor: Theme.of(context).canvasColor,

      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage( object ?  "assets/bg2.png"  : "assets/bg1.jpg"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(

          child: Column(
            children: <Widget>[

              SizedBox(height: 20,),

              notificationTile("Security","Activate the two-step authentification",Icons.security),

              notificationTile("Devices","The Microwave has finished",Icons.devices),

              notificationTile("Users","A new person detected near",Icons.person_outline),

              notificationTile("Devices","New device detected: Alexa",Icons.qr_code_rounded),


            ],
          ),
        ),
      ),
    ) ;
  }


  Widget notificationTile(name,role,icon){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 17),
      child: GlassMorphism(
        start: 0.1,
        end: 0.6,
        topRight: 10,
        topLeft: 10,
        bottomLeft: 10,
        bottomRight: 10,
        blurx: 2,
        blury: 4,
        child: ListTile(

          leading: Icon(icon),
          title:  Text(
            name,
            textScaleFactor: 1,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          trailing:  Icon(Icons.arrow_forward_ios_outlined),
          subtitle:  Text(role, style: Theme.of(context).textTheme.titleMedium,
          ),
          selected: true,

        ),
      ),
    );
  }
}


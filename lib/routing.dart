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
  var pages = [Dashboard(),Appliance(), Notifications(),Settings()];

  Widget MyTile(icon,text,index){
    return ListTile(

      leading: Icon(icon,
        color: Colors.deepPurple),
      title: Text(text,
        style: const TextStyle( fontSize: 20.0, color: Colors.deepPurple)),
      trailing: const Icon(Icons.arrow_right, color: Colors.deepPurple,),
      onTap: () {
        _onItemTapped(index);
      },
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => pages[index]));
  }


  @override
  Widget build(BuildContext context) {
    final object = Provider.of<DarkThemeProvider>(context).darkTheme;


    return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        routes: {
          '0': (context) => Dashboard(),
          '1': (context) => Appliance(),
          '2': (context) => Notifications(),
          '4': (context) => Settings(),
        },
        home: Scaffold(
          bottomNavigationBar: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
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
                      ? Icon(
                    Icons.home_filled,
                  )
                      : Icon(
                    Icons.home_outlined,
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
                      ? Icon(
                    Icons.work,
                      color: object
                          ? Colors.white
                          : Colors.deepPurple
                  )
                      : Icon(
                    Icons.work_outline_outlined,
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
                    Icons.widgets,
                  )
                      : const Icon(
                    Icons.widgets_outlined,
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
                    Icons.person,
                  )
                      : const Icon(
                    Icons.person_outline,
                  ),
                ),
              ],
            ),
          ),
          extendBodyBehindAppBar: true,
          /* appBar: AppBar(
              leading: Builder(
             builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.menu, color: Colors.deepPurple),
                  onPressed: () {
                    //open drawer
                    Scaffold.of(context).openDrawer();
                  },
                );
              }
            ),,
            backgroundColor: Color.fromRGBO(222,248,255,0),
            elevation: 0,

          ),*/
          body: pages[pageIndex],
        )
    );
  }
}

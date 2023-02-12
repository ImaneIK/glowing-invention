import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../DarkMode/DarkThemeProvider.dart';


class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);
  @override
  State<UserDetails> createState() => _UserDetailsState();
}
class _UserDetailsState extends State<UserDetails> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {
    var object = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        title: Text('My Profile'),

        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
            Icon(Icons.person_pin,size: 100),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),

                child: TextField(
                  decoration: InputDecoration(
                    hintText: "John Doe",
                    icon: Icon(Icons.person),
                  ),
                ),
              ),


            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Email:johan@gmail.com",
                  icon: Icon(Icons.email),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "mobile: +212657987456",
                  icon: Icon(Icons.phone),
                ),
              ),
            ),


            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: object ?  [const Color.fromRGBO(222,248,255,0.9), const Color.fromRGBO(222,248,255,0.4)] :[const Color.fromARGB(200,0,20,64), const Color.fromARGB(64,0,20,64)]

                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(onPressed: () {  },
                child: Text('Save changes',) ,
              ),
            ),

            SizedBox(height: 30.0,),
          ],
        ),
      ),

    ) ;
  }
}

import 'package:flutter/material.dart';
import 'package:lumosmaxima/HomePage.dart';
import 'package:lumosmaxima/routing.dart';
import 'package:provider/provider.dart';

import 'DarkMode/DarkThemeProvider.dart';
import 'Widgets/glass.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // var myController1 = TextEditingController();
  //var myController2 = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var object = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Scaffold(
        //backgroundColor: Colors.blue[200],
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage( object ?  "assets/bg2.png"  : "assets/bg1.jpg"),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image(
                          image: AssetImage("logo.png"),
                          height: 90,
                        ),
                        const Text(
                          "My Home",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: Colors.purple,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.79,
                    child: GlassMorphism(
                      start: 0.5,
                      end: 0.5,
                      topRight: 60,
                      topLeft: 60,
                      bottomLeft: 0,
                      bottomRight: 0,
                      blurx: 3,
                      blury: 3,
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Sign in to get access to your smart home",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              TextFormField(
                                //controller: myController2,
                                validator: (val) {
                                  if (val!.isEmpty)
                                    return "prière de saisir une valeur";
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Enter Email",
                                  labelStyle:
                                      TextStyle(color: Colors.deepPurple),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                //controller: myController2,
                                validator: (val) {
                                  if (val!.isEmpty)
                                    return "prière de saisir une valeur";
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Enter Password",
                                  labelStyle:
                                      TextStyle(color: Colors.deepPurple),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.deepPurple,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      setState(() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (c) => HomePage()));
                                      });
                                    } else {
                                      setState(() {
                                        print("Prière de fixer les erreurs");
                                      });
                                    }
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                        color: Colors.deepPurple, width: 1),
                                  ),
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Forgot ur password?... let's get u a new one",
                                style: TextStyle(color: Colors.deepPurple),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

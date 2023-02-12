import 'package:flutter/material.dart';
import 'package:lumosmaxima/HomePage.dart';
import 'package:provider/provider.dart';
import 'DarkMode/DarkThemeProvider.dart';
import 'Widgets/glass.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formkey = GlobalKey<FormState>();

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
                      image: AssetImage(
                          object ? "smart-home(1).png" : "smart-home.png"),
                      height: 90,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "My Home",
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Sans serif',
                        fontWeight: FontWeight.w400,
                        color: object
                            ? Colors.white70
                            : Color.fromRGBO(0, 23, 114, 1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: GlassMorphism(
                  start: 0.05,
                  end: 0.4,
                  topRight: 60,
                  topLeft: 60,
                  bottomLeft: 0,
                  bottomRight: 0,
                  blurx: 2,
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
                            style: Theme.of(context).textTheme.titleMedium,
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
                              prefixIcon: Icon(
                                Icons.email_outlined,
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
                              prefixIcon: Icon(
                                Icons.lock_outline,
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
                              borderRadius: BorderRadius.circular(10),
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
                                borderRadius: BorderRadius.circular(12.0),
                                side: BorderSide(
                                    color: object
                                        ? Colors.white70
                                        : Color.fromRGBO(0, 23, 114, 1),
                                    width: 1),
                              ),
                              child: Text("Sign In",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Forgot ur password?... let's get u a new one",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                          
                          GestureDetector(
                            onLongPress: (){
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (c) => HomePage()));
                              });
                            },
                              child: Icon(Icons.fingerprint, size: MediaQuery.of(context).size.height * 0.09,))
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

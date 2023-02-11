import 'package:flutter/material.dart';


class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);
  @override
  State<UserDetails> createState() => _UserDetailsState();
}
class _UserDetailsState extends State<UserDetails> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(254, 244, 255, 1),
        title: Text('User details',style: TextStyle(color: Colors.deepPurple),),

        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.deepPurple),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("bg1.jpg"), fit: BoxFit.cover)),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [
              SizedBox(height: 10,),
              Icon(Icons.person_pin,size: 100, color: Colors.purple),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),

                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "User Name",
                      icon: Icon(Icons.person),
                    ),
                  ),
                ),


              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Email:johan@gmail.com",
                    icon: Icon(Icons.email),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "mobile: +212657987456",
                    icon: Icon(Icons.phone),
                  ),
                ),
              ),

              SizedBox(height: 10.0,),

              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [const Color.fromRGBO(222,248,255,0.9), const Color.fromRGBO(222,248,255,0.4)]
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: MaterialButton(onPressed: () {  },
                  child: const Text('Change role',style: TextStyle(color: Colors.deepPurple),) ,
                ),
              ),


              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [const Color.fromRGBO(222,248,255,0.9), const Color.fromRGBO(222,248,255,0.4)]
                            ),
                    borderRadius: BorderRadius.circular(10)),
                child: MaterialButton(onPressed: () {  },
                  child: const Text('Remove user',style: TextStyle(color: Colors.deepPurple),) ,
                ),
              ),



              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [const Color.fromRGBO(222,248,255,0.9), const Color.fromRGBO(222,248,255,0.4)]
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: MaterialButton(onPressed: () {  },
                  child: const Text('Save changes',style: TextStyle(color: Colors.deepPurple),) ,
                ),
              ),

              SizedBox(height: 10.0,),
            ],
          ),
        ),
      ),

    ) ;
  }
}

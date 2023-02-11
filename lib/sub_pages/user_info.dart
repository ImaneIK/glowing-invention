import 'package:flutter/material.dart';


const keyStatus = 'key-status';
const keyAbout = 'key-about';


class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {

  goBack(BuildContext context) { //navigation - "go back" arrow
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(254, 244, 255, 1),
        title: Text("Profile",style: TextStyle(color: Colors.deepPurple),),
        leading: GestureDetector( onTap: (){goBack(context);}, child: Icon(Icons.arrow_back,color: Colors.deepPurple)),
      ),

      body:Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("bg1.jpg"), fit: BoxFit.cover)),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(

            children: [

              SizedBox(height: 20,),
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('avatar.jpg'),
              ),

              SizedBox( height:20),

              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [const Color.fromRGBO(222,248,255,0.95), const Color.fromRGBO(222,248,255,0.4)]
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text('Username'),
                    subtitle: Text('John Doe'),
                    leading:  Icon(
                      Icons.admin_panel_settings,
                      color:Colors.purpleAccent,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,

                    ),
                  )),

              SizedBox( height:20),
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [const Color.fromRGBO(222,248,255,0.95), const Color.fromRGBO(222,248,255,0.4)]
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text('Role'),
                    subtitle: Text('Admin'),
                    leading:  Icon(
                      Icons.admin_panel_settings,
                      color:Colors.purpleAccent,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,

                    ),
                  )),
              SizedBox( height:20),
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [const Color.fromRGBO(222,248,255,0.95), const Color.fromRGBO(222,248,255,0.4)]
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text('Email'),
                    subtitle: Text('john.doe@gmail.com'),
                    leading:  Icon(
                      Icons.admin_panel_settings,
                      color:Colors.purpleAccent,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,

                    ),
                  )),
              SizedBox( height:20),
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [const Color.fromRGBO(222,248,255,0.95), const Color.fromRGBO(222,248,255,0.4)]
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text('Phone number'),
                    subtitle: Text('+11283922030'),
                    leading:  Icon(
                      Icons.admin_panel_settings,
                      color:Colors.purpleAccent,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,

                    ),
                  )),

            //  buildStatus(),
            //  buildAbout(),
            ],
          ),
        ),
      ) ,
    ) ;
  }
}





/*Widget buildStatus() {
  return TextInputSettingsTile(
      title: 'Status',
      settingKey: keyStatus,
      initialValue: 'Working 👩🏻‍💻 ',
      onChange: (status) {},
  );
}

Widget buildAbout() {
  return TextInputSettingsTile(
    title: 'About',
    settingKey: keyAbout,
    initialValue: 'Hi, I am Aleyna from Turkey.',
    onChange: (about) {},
  );
}
*/
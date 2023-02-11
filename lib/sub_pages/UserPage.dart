import 'package:flutter/material.dart';
import 'package:lumosmaxima/sub_pages/user_info.dart';
import 'package:lumosmaxima/sub_pages/users.dart';


class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => UserConf()) );
      },
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color.fromRGBO(222,248,255,0.95), const Color.fromRGBO(222,248,255,0.4)]
              ),
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text('John Doe'),
            subtitle: Text('Admin'),
            leading:  Icon(
              Icons.admin_panel_settings,
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined,

            ),
          )),
    );



       /*   const SizedBox(
            height: 16,
          ),
          buildAbout(),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );*/
  }
}

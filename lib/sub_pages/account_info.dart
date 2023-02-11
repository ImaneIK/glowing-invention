import 'package:flutter/material.dart';


Widget buildAccountInfo(BuildContext context) {
  return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color.fromRGBO(222,248,255,0.95), const Color.fromRGBO(222,248,255,0.4)]
          ),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text('Off Energy'),
        subtitle: Text(''),
        leading: const Icon(
          Icons.logout_outlined,
        ),
        trailing: Icon(Icons.arrow_forward_ios_outlined,

        ),
      ));
}

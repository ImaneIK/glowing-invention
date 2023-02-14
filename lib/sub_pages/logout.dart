import 'package:flutter/material.dart';

Widget buildLogout() {
  return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(222, 248, 255, 0.95),
                Color.fromRGBO(222, 248, 255, 0.4)
              ]),
          borderRadius: BorderRadius.circular(10)),
      child: const ListTile(
        title: Text('Logout'),
        subtitle: Text(''),
        leading: Icon(
          Icons.logout_outlined,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
        ),
      ));
}

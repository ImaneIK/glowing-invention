import 'package:flutter/cupertino.dart';

class  Room {
  String id;
  String title;
  IconData icon;
  int nbrDevices;
  Room({required this.title, required this.id, required this.icon, required this.nbrDevices});
}
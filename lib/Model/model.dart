import 'package:flutter/cupertino.dart';

class  Device {
  String id;
  String title;
  String status;
  IconData icon;
  bool isEnable;
  Device({
    required this.title,
    required this.status,
    required this.icon,
    required this.isEnable,
    required this.id});
}
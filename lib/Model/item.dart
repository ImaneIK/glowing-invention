import 'package:flutter/material.dart';
import 'package:lumosmaxima/Model/temperature.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class Item {
  Item({
    @required this.name,
    @required this.iconOn,
    @required this.iconOff,
    @required this.active,
    @required this.color,
    @required this.type,
  });

  String? name;
  IconData? iconOn;
  IconData? iconOff;
  bool? active;
  Color? color;
  ItemType? type;
}

enum ItemType { light, temperature, tv, sound }

List<dynamic> itemList = [

  Temperature(
    name: 'Microwave',
    iconOn: MdiIcons.microwave,
    iconOff: MdiIcons.microwaveOff,
    active: false,
    color: Color(0xFF5D24FB),
    type: ItemType.temperature,
  ),


];

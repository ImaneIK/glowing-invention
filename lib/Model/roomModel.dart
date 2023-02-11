import 'package:flutter/material.dart';
import 'package:lumosmaxima/Model/room.dart';
import 'package:scoped_model/scoped_model.dart';


class RoomModel extends Model{
  List<Room> _roomList = [
    Room(
      icon: Icons.bedroom_parent_outlined,
      id: '1',
      title : 'Bedroom',
      nbrDevices : 2,
    ),

    Room(
      icon: Icons.living_outlined,
      id: '2',
      title : 'living room',
      nbrDevices : 2,
    ),


    Room(
      icon: Icons.kitchen_outlined,
      id: '3',
      title : 'Kitchen',
      nbrDevices : 2,
    ),


    Room(
      icon: Icons.door_back_door_outlined,
      id: '4',
      title : 'portal',
      nbrDevices : 2,
    ),




  ];

}
class Rooms extends RoomModel {

  List<Room> get allYatch {
    return List.from(_roomList);
  }
}
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model.dart';

class ConnectedModel extends Model{
  List<Device> _deviceList = [
    Device(
        icon: Icons.ac_unit_outlined,
        id: '1',
        title : 'A/C',
        status : 'Connected',
        isEnable : true,
        ),

    Device(
      icon: Icons.microwave_outlined,
      id: '2',
      title : 'Microwave',
      status : 'Not Connected',
      isEnable : false,
    ),

    Device(
      icon: Icons.kitchen_outlined,
      id: '3',
      title : 'Freezer',
      status : 'Connected',
      isEnable : true,
    ),

    Device(
      icon: Icons.coffee_maker_outlined,
      id: '4',
      title : 'Coffee Maker',
      status : 'Not Connected',
      isEnable : false,
    ),

    Device(
      icon: Icons.heat_pump_outlined,
      id: '5',
      title : 'Stove',
      status : 'Not Connected',
      isEnable : false,
    ),

    Device(
      icon: Icons.light_rounded,
      id: '7',
      title : 'Lamp',
      status : 'Not Connected',
      isEnable : false,
    ),


  ];

}
class DeviceModel extends ConnectedModel {

  List<Device> get allYatch {
    return List.from(_deviceList);
  }
}

class EnabledDevices extends DeviceModel{
   List get  enabledDevices {
     return List.from(_deviceList.where((element) => element.isEnable==true)).toList();
   }
}

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'scenes.dart';

class Scenes extends Model{
  List<Scene> _sceneList = [
    Scene(
      icon: Icons.ac_unit_outlined,
      id: '1',
      title : 'Lunch time',
      status : 'Connected',
      isEnable : false,
    ),

    Scene(
      icon: Icons.microwave_outlined,
      id: '2',
      title : 'Evening',
      status : 'Not Connected',
      isEnable : false,
    ),

    Scene(
      icon: Icons.kitchen_outlined,
      id: '3',
      title : 'Tha Morning',
      status : 'Connected',
      isEnable : true,
    ),
  ];

}
class SceneModel extends Scenes {

  List<Scene> get allYatch {
    return List.from(_sceneList);
  }
}

class EnabledScene extends SceneModel{
  List get  enabledDevices {
    return List.from(_sceneList.where((element) => element.isEnable==true)).toList();
  }
}
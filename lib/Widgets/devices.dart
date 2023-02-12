import 'package:flutter/material.dart';

import '../Model/connectedModel.dart';
import '../Model/model.dart';
import '../views/devices/CoffeeMakerPage.dart';
import '../views/devices/FreezerPage.dart';
import '../views/devices/LampPage.dart';
import '../views/devices/MVPage.dart';
import '../views/devices/StovePage.dart';
import '../views/devices/ac.dart';

class DeviceSection extends StatefulWidget {
  final DeviceModel model;
  const DeviceSection(this.model, {super.key});

  @override
  State<DeviceSection> createState() => _DeviceSectionState();
}

class _DeviceSectionState extends State<DeviceSection> {
  getItemAndNavigate(Device model, context) {
    setState(() {
      if (model.title == "A/C") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AcPage()));
      } else if (model.title == "Microwave") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MVPage()));
      } else if (model.title == "Freezer") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FreezerPage()));
      } else if (model.title == "Coffee Maker") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CoffeeMakerPage()));
      } else if (model.title == "Stove") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StovePage()));
      } else if (model.title == "Lamp") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LampPage()));
      }
    });
  }

  Widget _buildDeviceCard(DeviceModel model, int index) {
    return InkWell(
      onTap: () => getItemAndNavigate(model.allYatch[index], context),
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: index % 2 == 0
            ? const EdgeInsets.fromLTRB(10, 7.5, 7.5, 7.5)
            : const EdgeInsets.fromLTRB(7, 7.5, 15, 7.5),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: model.allYatch[index].isEnable
                    ? [
                        const Color.fromRGBO(222, 248, 255, 0.95),
                        const Color.fromRGBO(222, 248, 255, 0.4)
                      ]
                    : [
                        const Color.fromRGBO(222, 248, 255, 0.5),
                        const Color.fromRGBO(222, 248, 255, 0.1)
                      ]),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(model.allYatch[index].icon,
                    color: model.allYatch[index].isEnable
                        ? Colors.deepPurple
                        : const Color(0xffa3a3a3)),
                Switch(
                    value: model.allYatch[index].isEnable,
                    activeColor: const Color(0xff457be4),
                    onChanged: (_) {
                      setState(() {
                        model.allYatch[index].isEnable =
                            !model.allYatch[index].isEnable;
                      });
                    })
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              model.allYatch[index].title,
              style: TextStyle(
                  color: model.allYatch[index].isEnable
                      ? Colors.deepPurple
                      : const Color(0xff302e45),
                  fontSize: 19,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              model.allYatch[index].isEnable ? 'Connected' : 'Not connected',
              style: TextStyle(
                  color: model.allYatch[index].isEnable
                      ? Colors.deepPurple
                      : const Color(0xffa3a3a3),
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _deviceGrid(DeviceModel model) {
    return Container(
        alignment: Alignment.topCenter,
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        height: 487,
        child: GridView.count(
          // mainAxisSpacing: 10,
          // crossAxisSpacing: 10,
          crossAxisCount: 2,
          padding: const EdgeInsets.all(0),
          children: List.generate(model.allYatch.length, (index) {
            return model.allYatch[index].title != null
                ? _buildDeviceCard(model, index)
                : Container(
                    height: 120,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 50),
                    margin: index % 2 == 0
                        ? const EdgeInsets.fromLTRB(15, 7.5, 7.5, 7.5)
                        : const EdgeInsets.fromLTRB(7.5, 7.5, 15, 7.5),
                    /*decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        blurRadius: 10,
                        offset: Offset(0, 10),
                        color: Color(0xfff1f0f2))
                  ],
                  color: Colors.white,
                  border: Border.all(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Color(0xffa3a3a3)),
                  borderRadius: BorderRadius.circular(20)),*/
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  );
          }),
        ));
  }

  //---------------------------------------------------------------------------------------------------

  bool isSwitched = false;
  var textValue = 'not Connected';

  void toggleSwitch(index) {
    if (widget.model.allYatch[index].isEnable) {
      setState(() {
        isSwitched = true;
        textValue = 'Connected';
      });
      // print('Connected');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'not Connected';
      });
      // print('not Connected');
    }
  }

  Widget switchToggle() {
    return Transform.scale(
      scale: 0.5,
      child: Switch(
        value: isSwitched,
        onChanged: toggleSwitch,
        activeColor: Colors.deepPurple,
      ),
    );
  }

  Widget dashCard(icon, text) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 100,
        width: 100,
        child: Center(
          child: Column(
            children: [
              Icon(icon),
              const SizedBox(
                height: 5,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
              Text(
                textValue,
                style: const TextStyle(fontSize: 8),
              ),

              //Switch(value: false, onChanged: ())
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _deviceGrid(widget.model);
  }
}

class DeviceDescription extends StatefulWidget {
  final Device modelHolder;

  DeviceDescription({required Key? key, required this.modelHolder});
  @override
  State<DeviceDescription> createState() => _DeviceDescriptionState();
}

class _DeviceDescriptionState extends State<DeviceDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
          Text(widget.modelHolder.title),
          SizedBox(
            height: 10,
          ),
          Text(widget.modelHolder.isEnable.toString()),
          // the selected item's description

          ElevatedButton(onPressed: () {}, child: Text("Buy Now!"))
        ]));
  }
}

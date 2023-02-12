import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../DarkMode/DarkThemeProvider.dart';
import '../Model/connectedModel.dart';
import '../Model/scenesModel.dart';
import '../Widgets/SceneSection.dart';
import '../Widgets/devices.dart';
import '../Widgets/glass.dart';
import '../routing.dart';

class Appliance extends StatefulWidget {
  final DeviceModel model1 = DeviceModel();
  final SceneModel model2 = SceneModel();

  @override
  State<Appliance> createState() => _ApplianceState();
}

class _ApplianceState extends State<Appliance> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Widget? redirectSection(section) {
    if (section == "devices") {
      return DeviceSection(widget.model1);
    } else if (section == "rooms") {
      return SceneSection(widget.model2);
    }
  }

  @override
  Widget build(BuildContext context) {
    var object = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.1,
        title:
        Text("Appliance", style: Theme.of(context).textTheme.displaySmall),
        leading: Icon(Icons.developer_board),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundColor: Colors.transparent, backgroundImage: AssetImage("smart-home.png"),),
          )
        ],),
      //drawer: MyDrawer(navigatorKey),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(object ? "assets/bg2.png" : "assets/bg1.jpg"),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Search",
                      suffixIcon: Icon(Icons.search_outlined,),),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      dashCard(Icons.cloud_outlined, "21°C", context),
                      dashCard(Icons.water_drop_outlined, "50%", context),
                      dashCard(Icons.co2_outlined, "2.1%", context),
                    ],
                  ),
                ),
                GlassMorphism(
                  start: 0.1,
                  end: 0.3,
                  topRight: 30,
                  topLeft: 30,
                  bottomLeft: 0,
                  bottomRight: 0,
                  blurx: 2,
                  blury: 2,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: object ? Colors.white70 : Colors.deepPurple,
                                    textStyle: const TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      section = "rooms";
                                    });
                                  },
                                  child: Text("Scenes")),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor: object ? Colors.white70 : Colors.deepPurple,
                                    textStyle: const TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      section = "devices";
                                    });
                                  },
                                  child: Text("Devices")),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: redirectSection(section),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget dashCard(icon, text, context) {
  return GlassMorphism(
    start: 0.1,
    end: 0.2,
    topRight: 30,
    topLeft: 30,
    bottomLeft: 30,
    bottomRight: 30,
    blurx: 3,
    blury: 3,
    child: Container(
      padding: EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 20),
      height: 100,
      width: MediaQuery.of(context).size.width * 0.24,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, size: 30,),
            Text(text, style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
          ],
        ),
      ),
    ),
  );
}

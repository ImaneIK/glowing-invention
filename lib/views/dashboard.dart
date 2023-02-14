import 'package:flutter/material.dart';
import 'package:lumosmaxima/views/settings.dart';
import 'package:provider/provider.dart';
import '../DarkMode/DarkThemeProvider.dart';
import '../Model/connectedModel.dart';
import '../Model/roomModel.dart';
import '../Widgets/glass.dart';
import '../main.dart';

class Dashboard extends StatefulWidget {
  final EnabledDevices model = EnabledDevices();
  final Rooms model2 = Rooms();

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    var object = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title:
            Text("Dashboard", style: Theme.of(context).textTheme.titleLarge),
        leading: Icon(Icons.dashboard_outlined),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(

                itemBuilder: (context) => [
                  const PopupMenuItem(value: 0, child: Text("Settings")),
                  const PopupMenuItem(value: 1, child: Text("Logout"))
                ],
                onSelected: (int value) {
                  setState(() {
                    if (value == 0) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                    }
                  });
                },
                child: CircleAvatar(backgroundColor: Colors.transparent, backgroundImage: AssetImage("avatar.jpg"),)),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(object ? "assets/bg2.png" : "assets/bg1.jpg"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("Wed, 15 Feb",style: Theme.of(context).textTheme.titleMedium),
                    Text("Hi, John Doe,", style: Theme.of(context).textTheme.displayLarge),
                    //Text("John Doe",textAlign: TextAlign.left, style: Theme.of(context).textTheme.displayMedium),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.wb_cloudy_outlined),
                      SizedBox(width: 8,),
                      Text("25°C", style: Theme.of(context).textTheme.titleMedium)
                    ],
                  ),
                  SizedBox(width: 20,),
                  Row(
                    children: [
                      Icon(Icons.water_drop_outlined),
                      Text("12%", style:Theme.of(context).textTheme.titleMedium)
                    ],
                  ),
                  SizedBox(width: 20,),
                  Row(
                    children: [
                      Icon(Icons.co2, size: 40,),
                      Text("0.2%", style: Theme.of(context).textTheme.titleMedium)
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),



              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                margin: EdgeInsets.all(10),
                height: 200,
                child: GlassMorphism(
                  start: 0.1,
                  end: 0.5,
                  topRight: 30,
                  topLeft: 30,
                  bottomLeft: 30,
                  bottomRight: 30,
                  blurx: 1,
                  blury: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: EdgeInsets.all(20),
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.door_back_door_outlined,size: 40,),

                              SizedBox( height: 20,),

                              Text( "Portal",  style: Theme.of(context).textTheme.displaySmall),

                              Text( "Locked", style: Theme.of(context).textTheme.titleMedium,),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),



              SizedBox(height: 30,),


              Container(
                margin: EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Icon(Icons.devices),
                    SizedBox(width: 10,),
                    Text("Active devices", style:Theme.of(context).textTheme.titleLarge,),
                  ],
                ),
              ),


              SizedBox(height: 10, ),


              Container(
                height: 150,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ListView.separated(
                  itemCount: widget.model.enabledDevices.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext, index) {
                    return _buildDeviceCard(widget.model, index);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(width: 20),
                ),
              ),


              SizedBox(height: 30,),


              Container(
                margin: EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Icon(Icons.chair),
                    SizedBox(width: 10,),
                    Text("My Rooms", style: Theme.of(context).textTheme.titleLarge,),
                  ],
                ),
              ),


              SizedBox(height: 10,),


              Container(
                height: 150,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ListView.separated(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext, index) {
                    return _buildRoomCard(widget.model2, index);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(width: 20),
                ),
              ),

              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoomCard(Rooms model, int index) {
    return GlassMorphism(
      start: 0.1,
      end: 0.3,
      topRight: 30,
      topLeft: 30,
      bottomLeft: 30,
      bottomRight: 30,
      blurx: 3,
      blury: 3,
      child: Container(
        height: 90,
        width: 130,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: index % 2 == 0
            ? EdgeInsets.fromLTRB(10, 7.5, 7.5, 7.5)
            : EdgeInsets.fromLTRB(7, 7.5, 15, 7.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(widget.model2.allYatch[index].icon),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.model2.allYatch[index].title,
              style: Theme.of(context).textTheme.displaySmall
            ),
            Text(
              "${widget.model2.allYatch[index].nbrDevices.toString()} devices",
              style:Theme.of(context).textTheme.titleMedium
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceCard(DeviceModel model, int index) {
    return GlassMorphism(
      start: 0.1,
      end: 0.3,
      topRight: 30,
      topLeft: 30,
      bottomLeft: 30,
      bottomRight: 30,
      blurx: 3,
      blury: 3,
      child: Container(
        height: 90,
        width: 130,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: index % 2 == 0
            ? EdgeInsets.fromLTRB(10, 7.5, 7.5, 7.5)
            : EdgeInsets.fromLTRB(7, 7.5, 15, 7.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(widget.model.enabledDevices[index].icon,),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.model.enabledDevices[index].title,
              style: Theme.of(context).textTheme.displaySmall
            ),
            Text(
              widget.model.enabledDevices[index].status,
                style: Theme.of(context).textTheme.titleMedium
            ),
          ],
        ),
      ),
    );
  }
}

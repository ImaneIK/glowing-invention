import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../DarkMode/DarkThemeProvider.dart';
import '../Model/connectedModel.dart';
import '../Model/roomModel.dart';
import '../Widgets/glass.dart';


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
      // backgroundColor: Color.fromRGBO(0, 0, 0, 0),
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,

        title: Text ("Dashboard", style: TextStyle(color: Theme.of(context).appBarTheme.titleTextStyle?.color),),
      //  backgroundColor: Color.fromRGBO(254, 244, 255, 1), title: Text('Dashboard',style: TextStyle(color: Colors.deepPurple),),
      ),
      //drawer: MyDrawer(navigatorKey),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage( object ?  "assets/bg2.png"  : "assets/bg1.jpg"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5, left:15, right: 15, bottom: 5),
                padding:
                EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Welcome Home,",
                      style: TextStyle(
                          fontSize: 24, color: Colors.deepPurple),
                    ),
                    Text("John Doe",
                        style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                            fontStyle: FontStyle.italic)),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.wb_cloudy_outlined,
                          color: Colors.deepPurple),
                      Text("25°C",
                          style: TextStyle(color: Colors.deepPurple))
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.water_drop_outlined,
                          color: Colors.deepPurple),
                      Text("12%",
                          style: TextStyle(color: Colors.deepPurple))
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.co2, color: Colors.deepPurple, size: 40,),
                      Text("0.2%",
                          style: TextStyle(color: Colors.deepPurple))
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                margin: EdgeInsets.all(10),
                height: 200,
                child: GlassMorphism(
                  start: 0.1,
                  end: 0.1,
                  topRight: 30,
                  topLeft: 30,
                  bottomLeft: 30,
                  bottomRight: 30,
                  blurx: 3,
                  blury: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    margin: EdgeInsets.all(20),
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.door_back_door_outlined,
                                  color: Colors.deepPurple),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Portal",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.deepPurple),
                              ),
                              Text(
                                "Locked",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.deepPurple),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Text(
                  "Active devices",
                  style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
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
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Text(
                  "My Rooms",
                  style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoomCard(Rooms model, int index) {
    return GlassMorphism(
      start: 0.1,
      end: 0.1,
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
            Icon(widget.model2.allYatch[index].icon, color: Colors.deepPurple),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.model2.allYatch[index].title,
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple),
            ),
            Text(
              "${widget.model2.allYatch[index].nbrDevices.toString()} devices",
              style: TextStyle(fontSize: 14, color: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceCard(DeviceModel model, int index) {
    return GlassMorphism(
      start: 0.1,
      end: 0.1,
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
            Icon(widget.model.enabledDevices[index].icon,
                color: Colors.deepPurple),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.model.enabledDevices[index].title,
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple),
            ),
            Text(
              widget.model.enabledDevices[index].status,
              style: TextStyle(fontSize: 14, color: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/glass.dart';


class CoffeeMakerPage extends StatefulWidget {
  @override
  State<CoffeeMakerPage> createState() => _CoffeeMakerPageState();
}

goBack(BuildContext context) {
  Navigator.pop(context);
}

class _CoffeeMakerPageState extends State<CoffeeMakerPage> {
  var isenabled = true;
  double progressVal = 0.5;
  var isconnected = 'Disconnected';



  Widget mode(name){
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 17),
        child: GlassMorphism(
          start: 0.1,
          end: 0.6,
          topRight: 10,
          topLeft: 10,
          bottomLeft: 10,
          bottomRight: 10,
          blurx: 2,
          blury: 4,
          child: ListTile(

            leading: Icon(Icons.coffee_maker_outlined),
            title:  Text(
              name,
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            trailing:  Icon(Icons.chevron_right),
          ),

        ),
      ),
    );
  }


  Widget recipe(name,icon){
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 17),
        child: GlassMorphism(
          start: 0.1,
          end: 0.6,
          topRight: 10,
          topLeft: 10,
          bottomLeft: 10,
          bottomRight: 10,
          blurx: 2,
          blury: 4,
          child: ListTile(

            leading: Icon(icon),
            title:  Text(
              name,
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            trailing:  Icon(Icons.chevron_right),
          ),

        ),
      ),
    );
  }


  Future<void> _showModeModal(BuildContext context) async {

    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            SizedBox(height: 30,),
            mode("Coarse grind"),
            mode("fine grind"),
            mode("Medium-Coarse"),
            mode("Medium-Fine"),
            mode("Medium Grind"),
          ],
        );
      },
    );
  }


  Future<void> _showRecipeModal(BuildContext context) async {

    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            SizedBox(height: 30,),
            recipe("Cappuccino",Icons.coffee_outlined),
            recipe("Espresso",Icons.coffee_outlined),
            recipe("Whipped Coffee",Icons.coffee_outlined),
            recipe("Chocolate Iced Coffee",Icons.coffee_outlined),
            recipe("Cafe Latte",Icons.coffee_outlined),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

        builder: (context, child){

          return Scaffold(
            backgroundColor: Theme.of(context).canvasColor,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                Center(
                                  child: Text("Coffee Machine",
                                      style: Theme.of(context).textTheme.titleLarge),
                                ),
                                IconButton(
                                    icon: const Icon(Icons.more_vert), onPressed: () {}),
                              ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Coffee Maker #M350',
                                      style: Theme.of(context).textTheme.titleLarge),
                                  Switch.adaptive(
                                    value: isenabled,
                                    onChanged: (bool v) {
                                      setState(() {
                                        isenabled = v;
                                        if (isenabled) {
                                          isconnected = 'Connected';
                                        } else if (isenabled == false) {
                                          isconnected = 'Disconnected';
                                        }
                                      });
                                    },
                                  )
                                ],
                              ),
                              Text(isconnected,
                                  style: Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),

                        if (isenabled)
                          Image.asset( 'coffee-machine.png', width: 230.w,)
                        else
                          Image.asset( 'coffee-machine(1).png', width: 230.w,),
                        
                        Center(
                          child: IconButton(
                            icon: const Icon(
                              Icons.power_settings_new,
                              color: Colors.blue,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {
                                if (isenabled) {
                                  isenabled = false;
                                  isconnected = 'Disconnected';
                                } else if (isenabled == false) {
                                  isenabled = true;
                                  isconnected = 'Connected';
                                }
                              });
                            },
                          ),
                        ),

                        SizedBox(height: 30,),
                        Center(child: Text("Espresso : Medium Grind", style: Theme.of(context).textTheme.titleLarge,))
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(222, 248, 255, 0.3),
                            Color.fromRGBO(222, 248, 255, 0.1)
                          ]),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        recipes(Icons.receipt_long_outlined, "Recipe", isenabled),
                        listItemStats(Icons.timer_outlined, "schedule", isenabled),
                        Modes(Icons.heat_pump_outlined, "Mode", isenabled)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

        }

    );
  }

  Widget Modes(icon, String name, bool value) {
    return GestureDetector(

      onTap: (){
        setState(() {
          _showModeModal(context);
        });
      },

      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isenabled
                  ? [
                const Color.fromRGBO(222, 248, 255, 0.95),
                const Color.fromRGBO(222, 248, 255, 0.4)
              ]
                  : [
                const Color.fromRGBO(222, 248, 255, 0.5),
                const Color.fromRGBO(222, 248, 255, 0.1)
              ]),
          //color: value == true ? Colors.white : Color.fromRGBO(75, 97, 88, 1.0)
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Icon(icon),
            const SizedBox(height: 15),
            Text(name, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 5),
            Icon(Icons.arrow_circle_up)
          ],
        ),
      ),
    );
  }

  Widget recipes(icon, String name, bool value) {
    return GestureDetector(

      onTap: (){
        setState(() {
          _showRecipeModal(context);
        });
      },

      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isenabled
                  ? [
                const Color.fromRGBO(222, 248, 255, 0.95),
                const Color.fromRGBO(222, 248, 255, 0.4)
              ]
                  : [
                const Color.fromRGBO(222, 248, 255, 0.5),
                const Color.fromRGBO(222, 248, 255, 0.1)
              ]),
          //color: value == true ? Colors.white : Color.fromRGBO(75, 97, 88, 1.0)
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Icon(icon),
            const SizedBox(height: 15),
            Text(name, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 5),
            Icon(Icons.arrow_circle_up)
          ],
        ),
      ),
    );
  }

  Widget listItemStats(icon, String name, bool value) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isenabled
                ? [
                    const Color.fromRGBO(222, 248, 255, 0.95),
                    const Color.fromRGBO(222, 248, 255, 0.4)
                  ]
                : [
                    const Color.fromRGBO(222, 248, 255, 0.5),
                    const Color.fromRGBO(222, 248, 255, 0.1)
                  ]),
        //color: value == true ? Colors.white : Color.fromRGBO(75, 97, 88, 1.0)
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Icon(icon),
          const SizedBox(height: 15),
          Text(name, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 5),
          Switch(
            value: value,
            onChanged: (newVal) {
              setState(() {
                value = newVal;
                print(newVal);
              });
            },
          )
        ],
      ),
    );
  }
}

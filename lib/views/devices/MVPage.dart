import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../../Widgets/utils.dart';

class MVPage extends StatefulWidget {
  @override
  State<MVPage> createState() => _MVPageState();
}

goBack(BuildContext context) {
  //navigation - "go back" arrow
  Navigator.pop(context);
}

class _MVPageState extends State<MVPage> {
  var isenabled = true;
  double progressVal = 0.5;
  var isconnected = 'Disconnected';
  @override
  Widget build(BuildContext context) {
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
                            icon: Icon(
                              Icons.arrow_back,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Center(
                            child: Text("Microwave",
                                style: Theme.of(context).textTheme.titleLarge),
                          ),
                          IconButton(
                              icon: Icon(Icons.more_vert), onPressed: () {}),
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
                            Text('Microwave #M354',
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
                        Text(isconnected),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('Temperature',
                      style: Theme.of(context).textTheme.displaySmall),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return SweepGradient(
                              startAngle: degToRad(0),
                              endAngle: degToRad(184),
                              colors: [
                                Colors.indigo,
                                Colors.grey.withAlpha(50)
                              ],
                              stops: [progressVal, progressVal],
                              transform: GradientRotation(
                                degToRad(178),
                              ),
                            ).createShader(rect);
                          },
                          /* child: Center(
              child: CustomArc(),
            ),*/
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.height * 0.3,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: isenabled
                                        ? [
                                            const Color.fromRGBO(
                                                222, 248, 255, 0.95),
                                            const Color.fromRGBO(
                                                222, 248, 255, 0.4)
                                          ]
                                        : [
                                            const Color.fromRGBO(
                                                222, 248, 255, 0.5),
                                            const Color.fromRGBO(
                                                222, 248, 255, 0.1)
                                          ]),
                                //color: Colors.white,
                                shape: BoxShape.circle,
                                /* border: Border.all(
                    color: Colors.white,
                    width: 20,
                    style: BorderStyle.solid,
                  ),*/
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 40,
                                      spreadRadius: 20,
                                      color: Colors.blue.withAlpha(normalize(
                                              progressVal * 20000, 100, 255)
                                          .toInt()),
                                      offset: Offset(1, 3))
                                ]),
                            child: SleekCircularSlider(
                              min: 60,
                              max: 240,
                              initialValue: 180,
                              appearance: CircularSliderAppearance(
                                startAngle: 180,
                                angleRange: 360,
                                size: kDiameter - 30,
                                customWidths: CustomSliderWidths(
                                  trackWidth: 5,
                                  shadowWidth: 0,
                                  progressBarWidth: 01,
                                  handlerSize: 10,
                                ),
                                customColors: CustomSliderColors(
                                  hideShadow: true,
                                  progressBarColor: Colors.transparent,
                                  trackColor: Colors.transparent,
                                  dotColor: Colors.lightBlueAccent,
                                ),
                              ),
                              onChange: (value) {
                                setState(() {
                                  progressVal = normalize(value, 60, 200);
                                });
                              },
                              innerWidget: (percentage) {
                                return Center(
                                  child: Text(
                                    '${percentage.toInt()}??c',
                                    style: TextStyle(
                                      fontSize: 50,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: IconButton(
                      icon: Icon(
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
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color.fromRGBO(222, 248, 255, 0.3),
                      const Color.fromRGBO(222, 248, 255, 0.1)
                    ]),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  listItemStats(
                      Icons.heat_pump_outlined, "cooking Mode", true),
                  listItemStats(Icons.timer_outlined, "Set Timer", isenabled),
                  listItemStats(
                      Icons.health_and_safety_outlined, "safe mode", false)
                ],
              ),
            ),
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
          SizedBox(height: 20),
          Icon(icon),
          SizedBox(height: 15),
          Text(name, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 5),
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

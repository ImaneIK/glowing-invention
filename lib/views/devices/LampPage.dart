import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../DarkMode/DarkThemeProvider.dart';
import '../../Widgets/power_btn.dart';
import '../../Widgets/typography.dart';



class LampPage extends StatefulWidget {
  @override
  State<LampPage> createState() => _LampPageState();
}

class _LampPageState extends State<LampPage> {
  bool _isOn = false;
  var isconnected = 'Disconnected';
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

        builder: (context, child) {
          return Scaffold(
            backgroundColor: Theme.of(context).canvasColor,

            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 32.h + MediaQuery.of(context).padding.top),
                    Row(
                      children: [

                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back_ios),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Light',
                              style: Theme.of(context).textTheme.displaySmall
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 36.h),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Smart lamp #L354',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        Text(isconnected,style: Theme.of(context).textTheme.titleMedium,),
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            listItemStats(Icons.ac_unit_outlined, "cooling Mode", false),
                            listItemStats(Icons.timer_outlined, "Set Timer", false),
                            listItemStats(Icons.local_fire_department_outlined, "Turbo Mode", false)
                          ],
                        ),

                      ],
                    ),
                      SizedBox(height: 20.h),
                      if (_isOn)
                      Image.asset( 'bulb(1).png', width: 230.w,)
                      else
                      Image.asset( 'bulb.png', width: 230.w,),


                      SizedBox(height: 40.h),

                    ChipButton(
                      child: const Icon(Icons.power_settings_new_rounded),
                      onPressed: () {
                        setState(() {
                          _isOn = !_isOn;
                          if(_isOn==true){
                            isconnected = 'Connected';
                          }else{
                            isconnected = 'Disconnected';
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );

        });

  }


  Widget listItemStats( icon, String name, bool value) {
    var object = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: object
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
            activeColor: Color.fromRGBO(4, 20, 244,1),
          )
        ],
      ),
    );
  }
}




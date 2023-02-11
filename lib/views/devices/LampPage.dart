import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            backgroundColor: Color.fromARGB(255,0,20,64),

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
                          child: const Icon(Icons.arrow_back_ios,color: Colors.white70),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Light',
                              style:
                              TextStyle(color: Colors.white70, fontSize: 30)
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
                              style: TextStyles.headline4
                                  .copyWith(color: Colors.white70),
                            ),
                          /*  Switch.adaptive(
                              value: _isOn,
                              onChanged: (bool v) {
                                setState(() {
                                  _isOn = v;

                                });
                              },
                              activeColor: SmartyColors.primary,
                            )*/
                          ],
                        ),
                        Text(
                          isconnected,
                          style: TextStyles.body.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    if (_isOn)
                      Image.asset(
                        'assets/light_on.png',
                        width: 159.w,
                      )
                    else
                      Image.asset(
                        'assets/light_off.png',
                        width: 75.w,
                      ),
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
}




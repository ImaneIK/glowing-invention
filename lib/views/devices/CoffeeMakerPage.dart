import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/colors.dart';
import '../../Widgets/power_btn.dart';
import '../../Widgets/typography.dart';


class CoffeeMakerPage extends StatefulWidget {
  @override
  State<CoffeeMakerPage> createState() => _CoffeeMakerPageState();
}

class _CoffeeMakerPageState extends State<CoffeeMakerPage> {
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

        builder: (context, child) {
          return Scaffold(
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
                              'Coffee Maker',
                              style: TextStyles.headline4,
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
                              'Kitchen',
                              style: TextStyles.headline4
                                  .copyWith(color: SmartyColors.grey),
                            ),
                            Switch.adaptive(
                              value: _isOn,
                              onChanged: (bool v) {
                                setState(() {
                                  _isOn = v;
                                });
                              },
                              activeColor: SmartyColors.primary,
                            )
                          ],
                        ),
                        Text(
                          'Heat temperature',
                          style: TextStyles.body.copyWith(color: SmartyColors.grey60),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    if (_isOn)
                      Image.asset(
                        'assets/coffee-machine.png',
                        width: 159.w,
                      )
                    else
                      Image.asset(
                        'assets/coffee-machine1.png',
                        width: 159.w,
                      ),

                    SizedBox(height: 80.h),
                    ChipButton(
                      child: const Icon(Icons.power_settings_new_rounded),
                      onPressed: () {
                        setState(() {
                          _isOn = !_isOn;
                        });
                      },
                    ),
                    ElevatedButton(onPressed: (){}, child: Text(
                      'Set timer',))
                  ],
                ),
              ),
            ),
          );
        });

  }
}




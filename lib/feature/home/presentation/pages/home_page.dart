import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_1/core/extensions/extensions.dart';
import 'package:flutter_test_1/ui/theme.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  static const platform = MethodChannel('com.example.flutter_test_1/battery');

  String _batteryLevel = 'Unknown';

  // Step 2: Method to call native code
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      // Invoke method on native side
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.backgroundColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              14.ph,
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/home_menu_icon.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                    Text(
                      "Index",
                      style: context.texts.subtitle1.copyWith(
                        color: ColorConst.primaryTextColor,
                      ),
                    ),
                    CircleAvatar(
                      radius: 21.r,
                      backgroundImage: AssetImage(
                        'assets/images/profile_icon.png',
                      ),
                      backgroundColor: ColorConst.primaryColor,
                    ),
                  ],
                ),
              ),
              84.ph,
              SvgPicture.asset(
                'assets/svgs/home_no_task_icon.svg',
                width: 227.w,
                height: 227.h,
              ),
              10.ph,
              Text(
                "What do you want to do today?",
                style: context.texts.headline6.copyWith(
                  color: ColorConst.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              10.ph,
              Text(
                "Tap the + button to add your tasks",
                style: context.texts.subtitle1.copyWith(
                  color: ColorConst.primaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

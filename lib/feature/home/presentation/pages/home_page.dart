import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar: AppBar(
        backgroundColor: ColorConst.backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Index',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home Page',
              style: TextStyle(
                color: ColorConst.primaryTextColor,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              _batteryLevel,
              style: TextStyle(color: Colors.white, fontSize: 18.sp),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: _getBatteryLevel,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8687E7),
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              ),
              child: Text(
                'Get Battery Level',
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

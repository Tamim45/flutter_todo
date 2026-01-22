import 'package:flutter/material.dart';
import 'package:flutter_test_1/ui/theme.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConst.backgroundColor,
        title: Text('Calendar', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text(
          'Calendar Page',
          style: TextStyle(color: ColorConst.primaryTextColor, fontSize: 24),
        ),
      ),
    );
  }
}

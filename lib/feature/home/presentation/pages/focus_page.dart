import 'package:flutter/material.dart';
import 'package:flutter_test_1/ui/theme.dart';

class FocusePage extends StatelessWidget {
  const FocusePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConst.backgroundColor,
        title: Text('Focus', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text(
          'Focus Page',
          style: TextStyle(color: ColorConst.primaryTextColor, fontSize: 24),
        ),
      ),
    );
  }
}

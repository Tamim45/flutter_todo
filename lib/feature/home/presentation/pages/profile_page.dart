import 'package:flutter/material.dart';
import 'package:flutter_test_1/ui/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConst.backgroundColor,
        title: Text('Profile', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text(
          'Profile Page',
          style: TextStyle(color: ColorConst.primaryTextColor, fontSize: 24),
        ),
      ),
    );
  }
}

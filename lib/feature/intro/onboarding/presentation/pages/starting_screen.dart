import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_1/core/extensions/extensions.dart';
import 'package:flutter_test_1/ui/theme.dart';
import 'package:flutter_test_1/ui/widgets/global_button.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            14.ph,
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 24.0,
                color: ColorConst.logoTextColor,
              ),
            ),
            58.ph,
            Center(
              child: Text(
                "Welcome to UpTodo",
                style: context.texts.headline2.copyWith(
                  color: ColorConst.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            26.ph,
            Center(
              child: Text(
                "Please login to your account or create new account to continue",
                textAlign: TextAlign.center,
                style: context.texts.subtitle1.copyWith(
                  color: ColorConst.primaryTextColor,
                ),
              ),
            ),
            370.ph,
            GlobalButton(
              label: "LOGIN",
              textStyle: context.texts.button.copyWith(
                fontSize: 16.sp,
                color: ColorConst.logoTextColor,
              ),
              onPressed: () {},
            ),
            28.ph,
            GlobalButton(
              label: "CREATE ACCOUNT",
              textStyle: context.texts.button.copyWith(
                fontSize: 16.sp,
                color: ColorConst.logoTextColor,
              ),
              background: Colors.transparent,
              borderColor: ColorConst.primaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

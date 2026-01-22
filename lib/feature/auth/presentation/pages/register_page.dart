import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_1/core/extensions/extensions.dart';
import 'package:flutter_test_1/feature/auth/presentation/widgets/auth_widget.dart';
import 'package:flutter_test_1/ui/theme.dart';
import 'package:flutter_test_1/ui/widgets/global_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    // Listen to text changes
    _usernameController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
    _confirmPasswordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isFormValid =
          _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          _passwordController.text == _confirmPasswordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.backgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
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
              41.ph,
              Text(
                "Register",
                style: context.texts.headline2.copyWith(
                  color: ColorConst.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              53.ph,
              FormWithText(
                labelText: "Username",
                hintText: "Enter your Username",
                controller: _usernameController,
              ),
              25.ph,
              FormWithText(
                labelText: "Password",
                hintText: "* * * * * * * * * * *",
                isPassword: true,
                controller: _passwordController,
              ),
              25.ph,
              FormWithText(
                labelText: "Confirm Password",
                hintText: "* * * * * * * * * * *",
                isPassword: true,
                controller: _confirmPasswordController,
              ),
              69.ph,
              Opacity(
                opacity: _isFormValid ? 1.0 : 0.5,
                child: GlobalButton(label: "Register", onPressed: () {}),
              ),
              31.ph,
              dividerWithText(text: 'or', color: Color(0xFF979797)),
              29.ph,
              GlobalButton(
                label: "Register with Google",
                background: Colors.transparent,
                borderColor: ColorConst.primaryColor,
                prefix: SvgPicture.asset(
                  'assets/svgs/google_icon.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                onPressed: () {
                  // Handle Google register
                },
              ),
              20.ph,
              GlobalButton(
                label: "Register with Apple",
                background: Colors.transparent,
                borderColor: ColorConst.primaryColor,
                prefix: SvgPicture.asset(
                  'assets/svgs/apple_icon.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                onPressed: () {
                  // Handle Apple register
                },
              ),
              46.ph,
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: context.texts.subtitle2.copyWith(
                          color: Color(0xFF979797),
                          fontSize: 12.sp,
                        ),
                      ),
                      TextSpan(
                        text: "Login",
                        style: context.texts.subtitle1.copyWith(
                          color: ColorConst.logoTextColor,
                          fontSize: 12.sp,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              20.ph,
            ],
          ),
        ),
      ),
    );
  }
}

Widget dividerWithText({String text = 'OR', Color? color}) {
  final dividerColor = color ?? Color(0xFF979797);

  return Row(
    children: [
      Expanded(child: Divider(color: dividerColor, thickness: 1.5)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Text(text, style: TextStyle(color: ColorConst.primaryTextColor)),
      ),
      Expanded(child: Divider(color: dividerColor, thickness: 1.5)),
    ],
  );
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_1/core/extensions/extensions.dart';
import 'package:flutter_test_1/feature/auth/presentation/widgets/auth_widget.dart';
import 'package:flutter_test_1/router/router.dart';
import 'package:flutter_test_1/ui/theme.dart';
import 'package:flutter_test_1/ui/widgets/global_button.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LocalAuthentication _localAuth = LocalAuthentication();
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    // Listen to text changes
    _usernameController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isFormValid =
          _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  Future<void> _handleLogin() async {
    try {
      // Check if biometric is available
      final bool canAuthenticateWithBiometrics =
          await _localAuth.canCheckBiometrics;
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await _localAuth.isDeviceSupported();

      if (!canAuthenticate) {
        _showErrorDialog(
          'Biometric authentication is not available on this device',
        );
        return;
      }

      // Authenticate with biometrics
      final bool didAuthenticate = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to login',
      );

      if (didAuthenticate) {
        // Authentication successful - proceed with login
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login successful!'),
              backgroundColor: Colors.green,
            ),
          );
          // Navigate to home or dashboard
          // Navigator.pushReplacementNamed(context, '/home');
        }
      } else {
        // Authentication failed
        _showErrorDialog('Authentication failed. Please try again.');
      }
    } catch (e) {
      _showErrorDialog('Error during authentication: ${e.toString()}');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorConst.backgroundColor,
        title: Text(
          'Authentication Failed',
          style: TextStyle(color: ColorConst.logoTextColor),
        ),
        content: Text(
          message,
          style: TextStyle(color: ColorConst.primaryTextColor),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK', style: TextStyle(color: ColorConst.primaryColor)),
          ),
        ],
      ),
    );
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
                "Login",
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
              69.ph,
              Opacity(
                opacity: _isFormValid ? 1.0 : 0.5,
                child: GlobalButton(
                  label: "Login",
                  onPressed: () {
                    context.pushNamed(Routes.home);
                  },
                ),
              ),
              31.ph,
              dividerWithText(text: 'or', color: Color(0xFF979797)),
              29.ph,
              GlobalButton(
                label: "Login with Google",
                background: Colors.transparent,
                borderColor: ColorConst.primaryColor,
                prefix: SvgPicture.asset(
                  'assets/svgs/google_icon.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                onPressed: () {
                  // Handle Google login
                },
              ),
              20.ph,
              GlobalButton(
                label: "Login with Apple",
                background: Colors.transparent,
                borderColor: ColorConst.primaryColor,
                prefix: SvgPicture.asset(
                  'assets/svgs/apple_icon.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                onPressed: () {
                  // Handle Apple login
                },
              ),
              46.ph,
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account? ",
                        style: context.texts.subtitle2.copyWith(
                          color: Color(0xFF979797),
                          fontSize: 12.sp,
                        ),
                      ),
                      TextSpan(
                        text: "Register",
                        style: context.texts.subtitle1.copyWith(
                          color: ColorConst.logoTextColor,
                          fontSize: 12.sp,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNamed(Routes.register);
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

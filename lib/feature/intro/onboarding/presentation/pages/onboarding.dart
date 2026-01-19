import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_1/core/extensions/extensions.dart';
import 'package:flutter_test_1/router/router.dart';
import 'package:flutter_test_1/ui/theme.dart';
import 'package:go_router/go_router.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingContent> _contents = [
    OnboardingContent(
      image: 'assets/svgs/onboarding_1.svg',
      title: 'Manage your tasks',
      description:
          'You can easily manage all of your daily tasks in DoMe for free',
    ),
    OnboardingContent(
      image: 'assets/svgs/onboarding_2.svg',
      title: 'Create daily routine',
      description:
          'In Uptodo  you can create your personalized routine to stay productive',
    ),
    OnboardingContent(
      image: 'assets/svgs/onboarding_3.svg',
      title: 'Organize your tasks',
      description:
          'You can organize your daily tasks by adding your tasks into separate categories',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < _contents.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

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
                context.pushNamed(Routes.starting);
              },
              child: Text(
                "Skip",
                style: context.texts.subtitle1.copyWith(
                  color: ColorConst.primaryTextColor,
                ),
              ),
            ),
            2.ph,
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _contents.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image placeholder
                      Container(
                        width: double.infinity,

                        child: SvgPicture.asset(_contents[index].image),
                      ),
                      SizedBox(height: 60.h),

                      // Title Text
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          _contents[index].title,
                          style: context.texts.headline5.copyWith(
                            color: ColorConst.logoTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Description Text
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          _contents[index].description,
                          style: context.texts.bodyText1.copyWith(
                            color: ColorConst.primaryTextColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Indicator (stays in place, only animates active state)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _contents.length,
                (dotIndex) => _buildIndicator(dotIndex == _currentPage),
              ),
            ),
            SizedBox(height: 40.h),

            // Navigation Buttons (stay in place, only visibility changes)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Previous Button (animates appearance/disappearance)
                  AnimatedOpacity(
                    opacity: _currentPage > 0 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: AnimatedScale(
                      scale: _currentPage > 0 ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: InkWell(
                        onTap: () {
                          _previousPage();
                        },
                        child: Text('Back', style: context.texts.subtitle1),
                      ),
                    ),
                  ),

                  // Next Button (stays visible, text changes)
                  ElevatedButton(
                    onPressed: _currentPage == _contents.length - 1
                        ? () {
                            context.pushNamed(Routes.starting);
                          }
                        : _nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConst.primaryColor,
                      foregroundColor: ColorConst.logoTextColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    child: Text(
                      _currentPage == _contents.length - 1
                          ? 'Get Started'
                          : 'Next',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildIndicator(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin: EdgeInsets.symmetric(horizontal: 4.w),
    height: 8.h,
    width: isActive ? 24.w : 8.w,
    decoration: BoxDecoration(
      color: isActive
          ? ColorConst.primaryTextColor
          : ColorConst.primaryTextColor.withOpacity(0.3),
      borderRadius: BorderRadius.circular(4.r),
    ),
  );
}

class OnboardingContent {
  final String image;
  final String title;
  final String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

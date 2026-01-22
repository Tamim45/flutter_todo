// lib/feature/home/presentation/pages/main_navigation.dart
import 'package:flutter/material.dart';
import 'package:flutter_test_1/feature/home/presentation/pages/calendar_page.dart';
import 'package:flutter_test_1/feature/home/presentation/pages/focus_page.dart';
import 'package:flutter_test_1/feature/home/presentation/pages/home_page.dart';
import 'package:flutter_test_1/feature/home/presentation/pages/profile_page.dart';
import 'package:flutter_test_1/ui/widgets/custom_bottom_nav.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  late PageController _pageController;

  // List of pages for each tab
  final List<Widget> _pages = [
    HomePage(), // Index page
    CalendarPage(), // Calendar page
    FocusePage(), // Focus page
    ProfilePage(), // Profile page
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
      extendBody: true,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

// lib/ui/widgets/custom_bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_sheets/add_task_bottom_sheet.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        color: Color(0xFF363636), // Dark gray from design
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Nav Items Row
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: Icons.home_filled,
                  label: 'Index',
                  index: 0,
                ),
                _buildNavItem(
                  icon: Icons.calendar_today_outlined,
                  label: 'Calendar',
                  index: 1,
                ),
                SizedBox(width: 60.w), // Space for center button
                _buildNavItem(
                  icon: Icons.access_time_outlined,
                  label: 'Focus',
                  index: 2,
                ),
                _buildNavItem(
                  icon: Icons.person_outline,
                  label: 'Profile',
                  index: 3,
                ),
              ],
            ),
          ),

          // Center Floating Button
          Positioned(
            top: -28.h,
            left: MediaQuery.of(context).size.width / 2 - 32.w,
            child: GestureDetector(
              onTap: () => AddTaskBottomSheet.show(context),
              child: Container(
                width: 64.w,
                height: 64.w,
                decoration: BoxDecoration(
                  color: Color(0xFF8687E7), // Purple color from design
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: Colors.white, size: 32.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
              size: 26.sp,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
                fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

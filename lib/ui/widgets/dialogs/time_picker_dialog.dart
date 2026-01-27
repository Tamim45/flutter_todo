import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTimePicker {
  static Future<TimeOfDay?> show(BuildContext context) async {
    int selectedHour = TimeOfDay.now().hour > 12
        ? TimeOfDay.now().hour - 12
        : (TimeOfDay.now().hour == 0 ? 12 : TimeOfDay.now().hour);
    int selectedMinute = TimeOfDay.now().minute;
    String selectedPeriod = TimeOfDay.now().period == DayPeriod.am
        ? 'AM'
        : 'PM';

    final hourController = FixedExtentScrollController(
      initialItem: selectedHour - 1,
    );
    final minuteController = FixedExtentScrollController(
      initialItem: selectedMinute,
    );

    TimeOfDay? result;

    await showDialog(
      context: context,
      barrierColor: Colors.black.withAlpha(200),
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return Dialog(
            backgroundColor: Color(0xFF363636),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Container(
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Choose Time',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildScrollPicker(
                        controller: hourController,
                        itemCount: 12,
                        selectedValue: selectedHour,
                        onChanged: (index) {
                          setDialogState(() {
                            selectedHour = index + 1;
                          });
                        },
                        builder: (index) {
                          final hour = index + 1;
                          final isSelected = selectedHour == hour;
                          return _buildPickerItem(
                            hour.toString().padLeft(2, '0'),
                            isSelected,
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          ':',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _buildScrollPicker(
                        controller: minuteController,
                        itemCount: 60,
                        selectedValue: selectedMinute,
                        onChanged: (index) {
                          setDialogState(() {
                            selectedMinute = index;
                          });
                        },
                        builder: (index) {
                          final isSelected = selectedMinute == index;
                          return _buildPickerItem(
                            index.toString().padLeft(2, '0'),
                            isSelected,
                          );
                        },
                      ),
                      SizedBox(width: 12.w),
                      _buildPeriodPicker(
                        selectedPeriod: selectedPeriod,
                        onChanged: (period) {
                          setDialogState(() {
                            selectedPeriod = period;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          hourController.dispose();
                          minuteController.dispose();
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      ElevatedButton(
                        onPressed: () {
                          int hour24 = selectedHour;
                          if (selectedPeriod == 'PM' && selectedHour != 12) {
                            hour24 = selectedHour + 12;
                          } else if (selectedPeriod == 'AM' &&
                              selectedHour == 12) {
                            hour24 = 0;
                          }

                          result = TimeOfDay(
                            hour: hour24,
                            minute: selectedMinute,
                          );

                          hourController.dispose();
                          minuteController.dispose();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF8687E7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 12.h,
                          ),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    return result;
  }

  static Widget _buildScrollPicker({
    required FixedExtentScrollController controller,
    required int itemCount,
    required int selectedValue,
    required Function(int) onChanged,
    required Widget Function(int) builder,
  }) {
    return SizedBox(
      width: 64.w,
      height: 64.h,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF2D2D2D),
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          ListWheelScrollView.useDelegate(
            controller: controller,
            itemExtent: 32.h,
            diameterRatio: 1.2,
            physics: FixedExtentScrollPhysics(),
            perspective: 0.005,
            onSelectedItemChanged: onChanged,
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: itemCount,
              builder: (context, index) => builder(index),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildPickerItem(String text, bool isSelected) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.3),
          fontSize: isSelected ? 24.sp : 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Widget _buildPeriodPicker({
    required String selectedPeriod,
    required Function(String) onChanged,
  }) {
    return Container(
      width: 64.w,
      height: 64.h,
      decoration: BoxDecoration(
        color: Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => onChanged('AM'),
            child: Container(
              height: 32.h,
              alignment: Alignment.center,
              child: Text(
                'AM',
                style: TextStyle(
                  color: selectedPeriod == 'AM'
                      ? Colors.white
                      : Colors.white.withOpacity(0.3),
                  fontSize: selectedPeriod == 'AM' ? 24.sp : 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onChanged('PM'),
            child: Container(
              height: 32.h,
              alignment: Alignment.center,
              child: Text(
                'PM',
                style: TextStyle(
                  color: selectedPeriod == 'PM'
                      ? Colors.white
                      : Colors.white.withOpacity(0.3),
                  fontSize: selectedPeriod == 'PM' ? 24.sp : 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

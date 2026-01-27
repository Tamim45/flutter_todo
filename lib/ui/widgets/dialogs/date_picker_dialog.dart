import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import 'time_picker_dialog.dart';

class CustomDatePicker {
  static Future<Map<String, dynamic>?> show(BuildContext context) async {
    DateTime selectedDay = DateTime.now();
    DateTime focusedDay = DateTime.now();
    TimeOfDay? selectedTime;

    Map<String, dynamic>? result;

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return Dialog(
            backgroundColor: Color(0xFF363636),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Container(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.chevron_left, color: Colors.white),
                        onPressed: () {
                          setDialogState(() {
                            focusedDay = DateTime(
                              focusedDay.year,
                              focusedDay.month - 1,
                            );
                          });
                        },
                      ),
                      Column(
                        children: [
                          Text(
                            _getMonthName(focusedDay.month).toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            focusedDay.year.toString(),
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.chevron_right, color: Colors.white),
                        onPressed: () {
                          setDialogState(() {
                            focusedDay = DateTime(
                              focusedDay.year,
                              focusedDay.month + 1,
                            );
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  TableCalendar(
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(Duration(days: 365)),
                    focusedDay: focusedDay,
                    selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                    onDaySelected: (selected, focused) {
                      setDialogState(() {
                        selectedDay = selected;
                        focusedDay = focused;
                      });
                    },
                    headerVisible: false,
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: TextStyle(color: Colors.white),
                      weekendTextStyle: TextStyle(color: Colors.red[300]!),
                      outsideTextStyle: TextStyle(color: Colors.grey),
                      selectedDecoration: BoxDecoration(
                        color: Color(0xFF8687E7),
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Color(0xFF8687E7).withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 12.sp,
                      ),
                      weekendStyle: TextStyle(
                        color: Colors.red[300]!,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          final time = await CustomTimePicker.show(context);
                          if (time != null) {
                            selectedTime = time;
                            result = {
                              'date': selectedDay,
                              'time': selectedTime,
                            };
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF8687E7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          'Choose Time',
                          style: TextStyle(color: Colors.white),
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

  static String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_1/core/extensions/extensions.dart';
import 'package:flutter_test_1/ui/theme.dart';

import '../dialogs/date_picker_dialog.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorConst.backgroundColor,
      isScrollControlled: true,
      barrierColor: Colors.black.withAlpha(220),
      builder: (context) => const AddTaskBottomSheet(),
    );
  }
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController taskController = TextEditingController();
  bool _showDescription = true;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    taskController.addListener(() {
      setState(() {
        _showDescription = taskController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  Future<void> _handleDateTimePicker() async {
    final result = await CustomDatePicker.show(context);
    if (result != null) {
      setState(() {
        _selectedDate = result['date'];
        _selectedTime = result['time'];
      });

      if (_selectedDate != null && _selectedTime != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Task scheduled for ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year} at ${_selectedTime!.format(context)}',
            ),
            backgroundColor: Color(0xFF363636),
          ),
        );
      }
    }
  }

  void _handleSubmit() {
    if (taskController.text.isNotEmpty) {
      // Add task logic here
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: Color(0xFF363636),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            16.ph,
            TextField(
              controller: taskController,
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
              decoration: InputDecoration(
                hintText: 'Do math homework',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 16.sp,
                ),
                filled: true,
                fillColor: Color(0xFF2D2D2D),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
              ),
            ),
            16.ph,
            if (_showDescription)
              Text(
                'Description',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14.sp,
                ),
              ),
            20.ph,
            Row(
              children: [
                _buildActionIcon(
                  icon: Icons.access_time_outlined,
                  onTap: _handleDateTimePicker,
                ),
                SizedBox(width: 16.w),
                _buildActionIcon(
                  icon: Icons.local_offer_outlined,
                  onTap: () {
                    // Handle category action
                  },
                ),
                SizedBox(width: 16.w),
                _buildActionIcon(
                  icon: Icons.flag_outlined,
                  onTap: () {
                    // Handle priority action
                  },
                ),
                Spacer(),
                _buildActionIcon(
                  icon: Icons.send_rounded,
                  onTap: _handleSubmit,
                  color: Color(0xFF8687E7),
                ),
              ],
            ),
            8.ph,
          ],
        ),
      ),
    );
  }

  Widget _buildActionIcon({
    required IconData icon,
    required VoidCallback onTap,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        child: Icon(icon, color: color ?? Colors.white, size: 24.sp),
      ),
    );
  }
}

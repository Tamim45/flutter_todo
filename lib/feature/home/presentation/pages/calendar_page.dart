import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_1/ui/theme.dart';

class CalendarPage extends ConsumerStatefulWidget {
  CalendarPage({super.key});

  final durationProvider = Provider<Duration>((ref) {
    return const Duration(seconds: 2);
  });

  @override
  ConsumerState<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _sizeController = TextEditingController();
  double _targetSize = 100.0;
  double _currentSize = 100.0;

  @override
  void initState() {
    super.initState();
    _sizeController.text = '100';

    // Listen to text changes and update size automatically
    _sizeController.addListener(() {
      final newSize = double.tryParse(_sizeController.text);
      if (newSize != null && newSize > 0 && newSize <= 500) {
        setState(() {
          _targetSize = newSize;
        });
      }
    });
  }

  @override
  void dispose() {
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final duration = ref.watch(widget.durationProvider);

    return Scaffold(
      backgroundColor: ColorConst.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConst.backgroundColor,
        elevation: 0,
        title: Text(
          'Animated Square',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Size Input Field
              TextField(
                controller: _sizeController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
                decoration: InputDecoration(
                  labelText: 'Size (10-500)',
                  labelStyle: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 14.sp,
                  ),
                  hintText: 'Enter square size',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 14.sp,
                  ),
                  filled: true,
                  fillColor: Color(0xFF2D2D2D),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                ),
              ),
              SizedBox(height: 30.h),

              // Info Text
              Text(
                'Current Size: ${_targetSize.toStringAsFixed(0)}',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14.sp,
                ),
              ),
              Text(
                'Animation Duration: ${duration.inSeconds}s',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 40.h),

              // Animated Square
              Expanded(
                child: Center(
                  child: TweenAnimationBuilder<double>(
                    key: ValueKey<double>(_targetSize),
                    duration: duration,
                    tween: Tween<double>(begin: _currentSize, end: _targetSize),
                    curve: Curves.easeInOut,
                    onEnd: () {
                      _currentSize = _targetSize;
                    },
                    builder: (context, size, child) {
                      return Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          color: Color(0xFF8687E7),
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF8687E7).withOpacity(0.4),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            '${size.toStringAsFixed(0)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: (size / 5).clamp(12.0, 48.0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

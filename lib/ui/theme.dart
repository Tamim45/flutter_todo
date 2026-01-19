import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_1/core/extensions/extensions.dart';

part './colors.dart';
part './layout/breakpoints.dart';
part './typography/font_weights.dart';
part './typography/text_styles.dart';
part './widgets/responsive_layout_builder.dart';

// final themeProvider = NotifierProvider<AppThemeNotifier, AppThemeNotifierState>(
//   AppThemeNotifier.new,
// );

// class AppThemeNotifier extends Notifier<AppThemeNotifierState> {
// late final CacheService _cacheService;
// @override
// AppThemeNotifierState build() {
//   _cacheService = ref.read(cacheServiceProvider);
//   Future.microtask(() async {
//     await _readCache();
//   });
//   return AppThemeNotifierState(
//     themeData: _compileThemeData('light'),
//     themeValue: 'light',
//   );
// }

// Future<void> _readCache() async {
//   const themeKey = 'apptheme';
//   final cachedthemevalue = _cacheService.retrieve(themeKey);

//   if (cachedthemevalue != null) {
//     state = state.copyWith(
//       themeData: _compileThemeData(cachedthemevalue as String),
//       themeValue: cachedthemevalue,
//     );
//   } else {
//     await _cacheService.save(themeKey, state.themeValue);
//   }
// }

// Future<void> toggleTheme() async {
//   const themeKey = 'apptheme';
//   final themeValue = state.themeValue == 'light' ? 'dark' : 'light';
//   state = state.copyWith(
//     themeData: _compileThemeData(themeValue),
//     themeValue: themeValue,
//   );
//   await _cacheService.save(themeKey, themeValue);
// }

//   ThemeData _compileThemeData(String themeValue) {
//     final colorScheme = themeValue == 'light'
//         ? AppColorSchemes.lightColorScheme
//         : AppColorSchemes.darkColorScheme;
//     return ThemeData(
//       useMaterial3: true,
//       colorScheme: colorScheme,
//       brightness: colorScheme.brightness,
//       appBarTheme: AppBarTheme(
//         shadowColor: colorScheme.primary.withValues(alpha: 0.5),
//         elevation: 0,
//         backgroundColor: ColorConst.bgWhite,
//         foregroundColor: ColorConst.cardTextBlack,
//       ),
//       scaffoldBackgroundColor: ColorConst.bgWhite,
//       sliderTheme: const SliderThemeData(
//         showValueIndicator: ShowValueIndicator.always,
//       ),
//     );
//   }
// }

class AppThemeNotifierState {
  AppThemeNotifierState({required this.themeData, required this.themeValue});

  final ThemeData themeData;
  final String themeValue;
  AppThemeNotifierState copyWith({ThemeData? themeData, String? themeValue}) {
    return AppThemeNotifierState(
      themeData: themeData ?? this.themeData,
      themeValue: themeValue ?? this.themeValue,
    );
  }
}

class AppThemeService {
  AppThemeService(this.context);
  final BuildContext context;
  final AppColors _lightColors = AppColors(
    primary: ColorConst.logoTextColor,
    secondary: ColorConst.secondaryColor,
  );

  final AppColors _darkColors = AppColors(
    primary: ColorConst.backgroundColor,
    secondary: ColorConst.primaryColor,
  );
  AppColors get themeData => Theme.of(context).brightness == Brightness.light
      ? _lightColors
      : _darkColors;
}

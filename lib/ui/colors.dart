part of './theme.dart';

class AppColors {
  final Color primary;
  final Color secondary;

  AppColors({required this.primary, required this.secondary});
}

abstract class AppSchemeColors {
  static final lightColorScheme = ColorScheme.light();
  static final darkColorScheme = ColorScheme.dark();
}

class ColorConst {
  static const Color primaryColor = Color(0xFF8875FF);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xFF121212);
  static const Color logoTextColor = Color(0xFFFFFFFF);
  static const Color primaryTextColor = Color(0xFFE0E0E0);
}

part of './extensions.dart';

extension AppTheme on BuildContext {
  AppColors get appTheme => AppThemeService(this).themeData;
}

extension AppInputDecorExtension on BuildContext {
  AppInputDecorationStyles get inputDecor => AppInputDecorationStyles(this);
}

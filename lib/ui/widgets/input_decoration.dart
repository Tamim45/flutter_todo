import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_1/core/extensions/extensions.dart';

class AppInputDecorationStyles {
  const AppInputDecorationStyles(this.context);
  final BuildContext context;
  InputDecoration outlinedInputDecor({
    String? hint,
    void Function()? clearText,
    String? counterText,
    Widget? prefix,
    BorderRadius? borderRadius,
    Widget? suffix,
    Color? focusColor,
    Color? fillColor,
    TextStyle? hintTextStyle,
    String? helperText,
    Widget? label,
    TextStyle? helperTextStyle,

    // NEW ↓
    EdgeInsetsGeometry? contentPadding,
    BoxConstraints? suffixIconConstraints,
    bool isDense = true,
    Color? borderColor,
  }) {
    return InputDecoration(
      fillColor: fillColor,
      prefixIcon: prefix,
      suffixIcon: suffix,
      // NEW ↓
      suffixIconConstraints: suffixIconConstraints,
      filled: true,
      isDense: isDense,
      counterText: counterText,
      helperText: helperText,
      helperStyle: helperTextStyle,
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: focusColor ?? context.appTheme.primary,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: borderColor ??
              context.appTheme.primary.withValues(alpha: 0.5),
        ),
      ),
      hintText: hint,
      hintMaxLines: 2,
      hintStyle: hintTextStyle ??
          context.texts.subtitle1.copyWith(
            color: context.appTheme.secondary.withValues(alpha: 0.5),
            fontSize: 14.sp,
          ),
      label: label,
      labelStyle: context.texts.bodyText2,
      contentPadding: contentPadding ??
          EdgeInsets.symmetric(
            horizontal: 0.04.sw,
            vertical: 0.03.sw,
          ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: borderColor ?? context.appTheme.primary,
        ),
      ),
      errorMaxLines: 4,
    );
  }

  InputDecoration underLinedInputDecor({
    String? hint,
    void Function()? clearText,
    String? counterText,
    Widget? prefix,
    BorderRadius? borderRadius,
    Widget? suffix,
    Color? focusColor,
    Color? fillColor,
    TextStyle? hintTextStyle,
    String? helperText,
    Widget? label,
    TextStyle? labelTextStyle,
    TextStyle? helperTextStyle,
  }) {
    return InputDecoration(
      fillColor: fillColor ?? Colors.transparent,
      prefixIcon: prefix,
      suffixIcon: suffix,
      filled: true,
      counterText: counterText,
      helperText: helperText,
      helperStyle: helperTextStyle,
      focusedBorder: UnderlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        borderSide: BorderSide(
          color: focusColor ?? context.appTheme.primary,
        ),
      ),
      border: UnderlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        borderSide: BorderSide(
          color: focusColor ?? context.appTheme.primary,
        ),
      ),
      hintText: hint,
      hintMaxLines: 2,
      hintStyle: hintTextStyle ??
          context.texts.subtitle1.copyWith(
            color: context.appTheme.secondary.withValues(alpha: 0.5),
            fontSize: 14.sp,
          ),
      label: label,
      labelStyle: labelTextStyle ?? context.texts.bodyText2,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 0.04.sw,
        vertical: 0.03.sw,
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        borderSide: BorderSide(
          color: focusColor ?? context.appTheme.primary,
          // color: context.appTheme.primary.withValues(alpha:0.5),
        ),
      ),
      errorMaxLines: 4,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_1/core/extensions/extensions.dart';
import 'package:flutter_test_1/ui/theme.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    required this.label,
    required this.onPressed,
    this.onLongPressed,
    super.key,
    this.background,
    this.textStyle,
    this.scale = 1,
    this.borderRadius = 4,
    this.height = 48,
    this.width,
    this.isLoading = false,
    this.filled = true,
    this.prefix,
    this.suffix,
    this.disable = false,
    this.borderColor,
    this.boxShadow = false,
    this.labelWidth,
    this.padding,
    this.circular = false,
    this.progressIndicator,
  });

  factory GlobalButton.filled({
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPressed,
    Color? background,
    TextStyle? textStyle,
    double scale = 1,
    double borderRadius = 4,
    double height = 48,
    double? width,
    bool isLoading = false,
    Widget? prefix,
    Widget? suffix,
    bool disable = false,
    bool boxShadow = false,
    Widget? progressIndicator,
  }) {
    return GlobalButton(
      label: label,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      background: background,
      textStyle: textStyle,
      scale: scale,
      borderRadius: borderRadius,
      height: height,
      width: width,
      isLoading: isLoading,
      prefix: prefix,
      suffix: suffix,
      disable: disable,
      boxShadow: boxShadow,
      progressIndicator: progressIndicator,
    );
  }

  factory GlobalButton.circular({
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPressed,
    Color? background,
    TextStyle? textStyle,
    double scale = 1,
    double height = 48,
    bool isLoading = false,
    Widget? prefix,
    Widget? suffix,
    bool disable = false,
    bool boxShadow = false,
    bool circular = true,
    double borderRadius = 8,
    Widget? progressIndicator,
  }) {
    return GlobalButton(
      label: label,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      background: background,
      textStyle: textStyle,
      scale: scale,
      height: height,
      width: height,
      isLoading: isLoading,
      prefix: prefix,
      suffix: suffix,
      disable: disable,
      boxShadow: boxShadow,
      circular: circular,
      borderRadius: borderRadius,
      progressIndicator: progressIndicator,
    );
  }

  factory GlobalButton.outlined({
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPressed,
    Color? background,
    TextStyle? textStyle,
    double scale = 1,
    double borderRadius = 8,
    double height = 48,
    double? width,
    bool isLoading = false,
    Widget? prefix,
    Widget? suffix,
    bool disable = false,
    bool boxShadow = false,
    Color? borderColor,
    EdgeInsetsGeometry? padding,
    Widget? progressIndicator,
  }) {
    return GlobalButton(
      label: label,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      background: background,
      textStyle: textStyle,
      scale: scale,
      borderRadius: borderRadius,
      height: height,
      width: width,
      isLoading: isLoading,
      filled: false,
      prefix: prefix,
      suffix: suffix,
      disable: disable,
      boxShadow: boxShadow,
      borderColor: borderColor,
      padding: padding,
      progressIndicator: progressIndicator,
    );
  }

  factory GlobalButton.icon({
    required VoidCallback onPressed,
    String label = '',
    VoidCallback? onLongPressed,
    Color? background,
    TextStyle? textStyle,
    double scale = 1,
    double borderRadius = 8,
    double height = 24,
    double width = 24,
    bool isLoading = false,
    Widget? child,
    bool disable = false,
    bool boxShadow = false,
    bool filled = false,
    Color? borderColor,
    Widget? progressIndicator,
  }) {
    return GlobalButton(
      label: label,
      filled: filled,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      background: background,
      textStyle: textStyle,
      scale: scale,
      borderRadius: borderRadius,
      height: height,
      width: width,
      isLoading: isLoading,
      prefix: child,
      disable: disable,
      boxShadow: boxShadow,
      borderColor: borderColor,
      progressIndicator: progressIndicator,
    );
  }
  factory GlobalButton.text({
    required VoidCallback onPressed,
    required String label,
    VoidCallback? onLongPressed,
    Color? background,
    TextStyle? textStyle,
    double scale = 1,
    double borderRadius = 8,
    double height = 24,
    double width = 80,
    bool isLoading = false,
    Widget? child,
    bool disable = false,
    bool boxShadow = false,
    bool filled = false,
    Color? borderColor,
    Widget? progressIndicator,
  }) {
    return GlobalButton(
      label: label,
      filled: filled,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      background: background,
      textStyle: textStyle,
      scale: scale,
      borderRadius: borderRadius,
      height: height,
      width: width,
      isLoading: isLoading,
      prefix: child,
      disable: disable,
      boxShadow: boxShadow,
      borderColor: borderColor,
      progressIndicator: progressIndicator,
    );
  }

  final VoidCallback onPressed;
  final VoidCallback? onLongPressed;
  final String label;
  final Color? background;
  final TextStyle? textStyle;
  final double scale;
  final double borderRadius;
  final double height;
  final double? width;
  final bool filled;
  final bool isLoading;
  final Widget? prefix;
  final Widget? suffix;
  final bool disable;
  final bool boxShadow;
  final Color? borderColor;
  final double? labelWidth;
  final EdgeInsetsGeometry? padding;
  final bool circular;
  final Widget? progressIndicator;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: disable
          ? null
          : isLoading
          ? null
          : onLongPressed,
      onTap: disable
          ? null
          : isLoading
          ? null
          : onPressed,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        width: width,
        padding: padding ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: filled
              ? disable
                    ? Colors.grey
                    : background ?? ColorConst.primaryColor
              : Colors.transparent,
          borderRadius: !circular ? BorderRadius.circular(borderRadius) : null,
          shape: circular ? BoxShape.circle : BoxShape.rectangle,
          boxShadow: boxShadow
              ? [
                  BoxShadow(
                    color: ColorConst.primaryColor.withOpacity(0.4),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
          border: borderColor.isNull
              ? null
              : Border.all(
                  color: disable
                      ? Colors.grey
                      : borderColor ?? ColorConst.primaryColor,
                  width: 1.5,
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefix != null && !isLoading) ...[
              prefix!,
              if (label != '')
                SizedBox(width: 10.w)
              else
                const SizedBox.shrink(),
            ],
            if (isLoading)
              Transform.scale(
                scale: scale,
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child:
                      progressIndicator ??
                      CircularProgressIndicator(
                        color: textStyle?.color ?? ColorConst.logoTextColor,
                      ),
                ),
              )
            else if (label != '')
              SizedBox(
                width: labelWidth,
                child: Center(
                  child: Text(
                    label,
                    style:
                        textStyle ??
                        context.texts.button.copyWith(
                          color: filled
                              ? ColorConst.logoTextColor
                              : ColorConst.primaryColor,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            if (suffix != null && !isLoading) ...[
              if (label != '')
                SizedBox(width: 10.w)
              else
                const SizedBox.shrink(),
              suffix!,
            ],
          ],
        ),
      ),
    );
  }
}

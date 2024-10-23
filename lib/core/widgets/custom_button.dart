import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';

class CustomButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key,
        this.borderRadius,
        this.backgroundColor,
        this.horizontalPadding,
        this.verticalPadding,
        this.buttonWidth,
        required this.buttonText,
        required this.textStyle,
        required this.onPressed, this.buttonHeight});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 16.r))),
          backgroundColor: WidgetStatePropertyAll(
              backgroundColor ?? AppColors.primaryColor),
          padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 12.w,
              vertical: verticalPadding ?? 14.h)),
          fixedSize: WidgetStateProperty.all(Size(
              buttonWidth ?? double.maxFinite,
              buttonHeight ?? 50.h))),
      child: Text(buttonText, style: textStyle ,),
    );
  }
}
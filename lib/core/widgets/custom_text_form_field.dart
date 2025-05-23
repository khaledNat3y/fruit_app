import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theming/text_styles.dart';

import '../theming/app_colors.dart';
import '../utils/fancations/build_out_line_input_border.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? icon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String?) validator;
  final void Function(String?)? onSaved;

  const CustomTextFormField(
      {super.key,
        required this.hintText,
        this.isObscureText,
        this.contentPadding,
        this.focusedBorder,
        this.enabledBorder,
        this.inputTextStyle,
        this.hintStyle,
        this.suffixIcon,
        this.backgroundColor,
        this.controller,
        required this.validator, this.keyboardType, this.onSaved, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorErrorColor: AppColors.red,
      onSaved: onSaved,
      cursorColor: AppColors.lighterGrey,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabled: true,
        fillColor: backgroundColor ?? AppColors.textFieldBackground,
        filled: true,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        border: buildOutlineInputBorder(),
        focusedBorder: focusedBorder ?? buildOutlineInputBorder(),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.3, color: Colors.red),
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabledBorder: enabledBorder ?? buildOutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.3, color: Colors.red),
          borderRadius: BorderRadius.circular(4.0),
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.font13Regular.copyWith(color: AppColors.lightGrey),
        suffixIcon: suffixIcon,
        icon: icon,
      ),
      obscureText: isObscureText ?? false,
      style: AppStyles.font14Medium,
      validator: (value) {
        return validator(value);
      },
    );
  }


}
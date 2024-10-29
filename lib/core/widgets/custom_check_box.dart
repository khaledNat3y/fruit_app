import 'package:flutter/material.dart';
import '../../../../core/theming/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final IconData checkIcon;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.checkIcon = Icons.check, // Default icon, can be customized
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(6.0),
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: value ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: AppColors.lighterGrey,
            width: 2.0,
          ),
        ),
        child: value
            ? Icon(
          checkIcon,
          color: Colors.white,
          size: 18.0, // Adjust icon size as needed
        )
            : null,
      ),
    );
  }
}

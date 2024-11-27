import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/helpers/spacing.dart';
import 'package:fruits_app/core/theming/app_colors.dart';

import '../../../../../core/theming/text_styles.dart';

class ActiveItem extends StatelessWidget {
  final String label;
  final String imagePath;

  const ActiveItem({super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 16),
          decoration: ShapeDecoration(
            color: const Color(0xFFEEEEEE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Center(child: SvgPicture.asset(imagePath)),
              ),
              horizontalSpace(4),
              Text(label,
                  style: AppStyles.font11SemiBold.copyWith(
                    color: AppColors.primaryColor,
                  )),
            ],
          )),
    );
  }
}

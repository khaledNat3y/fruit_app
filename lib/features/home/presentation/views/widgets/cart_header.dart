import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theming/text_styles.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../generated/l10n.dart';

class CartHeader extends StatelessWidget {
  final int productsLength;
  const CartHeader({super.key, required this.productsLength});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: const BoxDecoration(color: AppColors.lighterGreen),
      child: Center(
        child: Text(
          "${S.of(context).you_have} $productsLength ${S.of(context).products_in_your_cart}",
          style: AppStyles.font13Regular.copyWith(color: AppColors.primaryColor,height: 1.6),
        ),
      ),
    );
  }
}

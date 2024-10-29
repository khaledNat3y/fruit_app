import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(
      S.of(context).forgot,
      style: AppStyles.font13SemiBold.copyWith(
          color: AppColors.lightPrimaryColor, fontFamily: 'Cairo'),
    );
  }
}

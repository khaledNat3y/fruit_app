import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class OrLoginWith extends StatelessWidget {
  const OrLoginWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.lighterGrey,
          ),
        ),
        horizontalSpace(10),
        Text(
          S.of(context).or,
          style: AppStyles.font18SemiBold,
        ),
        horizontalSpace(10),
        Expanded(
          child: Divider(
            color: AppColors.lighterGrey,
          ),
        ),
      ],
    );
  }
}

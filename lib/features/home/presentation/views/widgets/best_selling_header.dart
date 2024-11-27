import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theming/text_styles.dart';

import '../../../../../generated/l10n.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).best_selling,
          textAlign: TextAlign.right,
          style: AppStyles.font16Bold.copyWith(color: const Color(0xFF0C0D0D)),
        ),
        Text(
          S.of(context).more,
          textAlign: TextAlign.center,
          style: AppStyles.font13Regular.copyWith(color: const Color(0xFF949D9E)),
        )
      ],
    );
  }
}

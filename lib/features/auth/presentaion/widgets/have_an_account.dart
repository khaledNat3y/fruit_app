import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/helpers/extensions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: S.of(context).you_already_have_an_account,
          style: AppStyles.font16SemiBold.copyWith(color: AppColors.lightGrey),
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pop();
                },
              text: S.of(context).login,
              style: AppStyles.font16SemiBold
                  .copyWith(color: AppColors.primaryColor, fontFamily: 'Cairo'),
            ),
          ],
        ),
      ),
    );
  }
}

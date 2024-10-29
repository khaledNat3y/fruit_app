import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/helpers/extensions.dart';
import 'package:fruits_app/core/routing/routes.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            text: S.of(context).dont_have_account,
            style: AppStyles.font16SemiBold
                .copyWith(color: AppColors.lightGrey, fontFamily: 'Cairo'),
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () {
                  context.pushNamed(Routes.signupScreen);
                },
                text: S.of(context).make_account,
                style: AppStyles.font16SemiBold
                    .copyWith(color: AppColors.primaryColor, fontFamily: 'Cairo'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
// Text(
// S.of(context).dont_have_account,
// style: AppStyles.font16SemiBold.copyWith(
// color: AppColors.lightGrey, fontFamily: 'Cairo'),
// ),
// TextButton(
// onPressed: () {},
// child: Text(
// S.of(context).make_account,
// style: AppStyles.font16SemiBold.copyWith(
// color: AppColors.lightPrimaryColor, fontFamily: 'Cairo'),
// ))

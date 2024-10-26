import 'package:flutter/material.dart';
import 'package:fruits_app/core/helpers/spacing.dart';
import 'package:fruits_app/core/theming/app_colors.dart';
import 'package:fruits_app/core/theming/text_styles.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/auth/presentaion/widgets/custom_text_form_field.dart';

import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import 'custom_third_party_login_widget.dart';
import 'dont_have_account.dart';
import 'or_login_with.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Column(
          /// if ar then it will be start else it will be end
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            verticalSpace(33),

            /// Login field
            CustomTextFormField(
                hintText: S.of(context).email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {}),
            verticalSpace(16),

            /// Password field
            CustomTextFormField(
                hintText: S.of(context).password,
                isObscureText: true,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: Icon(
                  Icons.visibility,
                  color: AppColors.lighterGrey,
                  size: 25,
                ),
                validator: (value) {}),
            verticalSpace(16),
            Text(
              S.of(context).forgot,
              style: AppStyles.font13SemiBold.copyWith(
                  color: AppColors.lightPrimaryColor, fontFamily: 'Cairo'),
            ),
            verticalSpace(33),
            CustomButton(
                buttonText: S.of(context).login,
                textStyle:
                    AppStyles.font16Bold.copyWith(color: AppColors.white),
                onPressed: () {}),
            verticalSpace(33),
            DontHaveAnAccount(),
            verticalSpace(37),
            OrLoginWith(),
            verticalSpace(21),
            CustomThirdPartyLoginWidget(
              title: S.of(context).login_with_google,
              image: Assets.imagesGoogleIcon,
              onTap: (){},
            ),
            verticalSpace(16),
            CustomThirdPartyLoginWidget(
              title: S.of(context).login_with_apple,
              image: Assets.imagesAppleIcon,
              onTap: (){},
            ),
            verticalSpace(16),
            CustomThirdPartyLoginWidget(
              title: S.of(context).login_with_facebook,
              image: Assets.imagesFacebookIcon,
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}


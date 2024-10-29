import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/helpers/extensions.dart';
import 'package:fruits_app/core/helpers/spacing.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/auth/presentaion/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/auth/presentaion/widgets/terms_and_conditions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';
import 'have_an_account.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  bool isObscureText = true;
  bool isTermsAccepted = false; // Track checkbox state

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            verticalSpace(24),
            CustomTextFormField(
                hintText: S.of(context).full_name, validator: (value) {}),
            verticalSpace(16.0),
            CustomTextFormField(
                hintText: S.of(context).email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {}),
            verticalSpace(16.0),
            CustomTextFormField(
              hintText: S.of(context).password,
              keyboardType: TextInputType.visiblePassword,
              isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  isObscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.lighterGrey,
                  size: 25,
                ),
              ),
              validator: (value) {},
            ),
            verticalSpace(16.0),
            TermsAndConditions(
              value: isTermsAccepted,
              onChanged: (newValue) {
                setState(() {
                  isTermsAccepted = newValue ?? false;
                });
              },
            ),
            verticalSpace(30.0),
            CustomButton(
                buttonText: S.of(context).new_account_registration,
                textStyle:
                    AppStyles.font16Bold.copyWith(color: AppColors.white),
                onPressed: () {}),
            verticalSpace(26),
            HaveAnAccount(),
          ],
        ),
      ),
    );
  }
}


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helpers/app_regex.dart';
import 'package:fruits_app/core/helpers/spacing.dart';
import 'package:fruits_app/core/theming/app_colors.dart';
import 'package:fruits_app/core/theming/text_styles.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/auth/presentaion/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';

import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import 'custom_third_party_login_widget.dart';
import 'dont_have_account.dart';
import 'forgot_password.dart';
import 'or_login_with.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  bool isObscureText = true;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            /// if ar then it will be start else it will be end
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              verticalSpace(33),
              /// Login field
              CustomTextFormField(
                  hintText: S.of(context).email,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (userEmail) {
                    email = userEmail!.trim();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).please_enter_you_email;
                    }
                    return null;
                  }),
              verticalSpace(16),
              /// Password field
              CustomTextFormField(
                  hintText: S.of(context).password,
                  isObscureText: isObscureText,
                  keyboardType: TextInputType.visiblePassword,
                  onSaved: (userPassword) {
                    password = userPassword!.trim();
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    child: Icon(
                      isObscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.lighterGrey,
                      size: 25,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).please_enter_you_password;
                    }
                    return null;
                  }),
              verticalSpace(16),
              ForgotPassword(),
              verticalSpace(33),
              CustomButton(
                  buttonText: S.of(context).login,
                  textStyle:
                      AppStyles.font16Bold.copyWith(color: AppColors.white),
                  onPressed: () {
                    validateMethod(context);
                  }),
              verticalSpace(33),
              DontHaveAnAccount(),
              verticalSpace(37),
              OrLoginWith(),
              verticalSpace(21),
              CustomThirdPartyLoginWidget(
                title: S.of(context).login_with_google,
                image: Assets.imagesGoogleIcon,
                onTap: (){
                  context.read<SignInCubit>().signInWithGoogle();
                },
              ),
              verticalSpace(16),
              Platform.isIOS ? Column(
                children: [
                  CustomThirdPartyLoginWidget(
                    title: S.of(context).login_with_apple,
                    image: Assets.imagesAppleIcon,
                    onTap: (){
                      context.read<SignInCubit>().signInWithApple();
                    },
                  ),
                  verticalSpace(16),
                ],
              ) : SizedBox(),
              CustomThirdPartyLoginWidget(
                title: S.of(context).login_with_facebook,
                image: Assets.imagesFacebookIcon,
                onTap: (){
                  context.read<SignInCubit>().signInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateMethod(BuildContext context) {
    if(formKey.currentState!.validate()) {
      formKey.currentState!.save();
      context
          .read<SignInCubit>()
          .signInWithEmailAndPassword(email: email, password: password);
    } else {
      autoValidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}


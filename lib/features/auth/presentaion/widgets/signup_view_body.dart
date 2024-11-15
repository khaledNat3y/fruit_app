import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helpers/extensions.dart';
import 'package:fruits_app/core/helpers/spacing.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/auth/presentaion/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_app/features/auth/presentaion/signup_view.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/auth/presentaion/widgets/terms_and_conditions.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/snack_bar_helper.dart';
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password, name;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              verticalSpace(24),
              CustomTextFormField(
                  hintText: S.of(context).full_name,
                  onSaved: (useName) {
                    name = useName!.trim();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).please_enter_you_name;
                    }
                    return null;
                  }),
              verticalSpace(16.0),
              CustomTextFormField(
                  hintText: S.of(context).email,
                  onSaved: (useEmail) {
                    email = useEmail!.trim();
                  },
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).please_enter_you_email;
                    }
                    var validPassword = AppRegex.isEmailValid(value);
                    if (!validPassword) {
                      return S.of(context).please_enter_a_valid_email;
                    }
                    return null;
                  }),
              verticalSpace(16.0),
              CustomTextFormField(
                hintText: S.of(context).password,
                onSaved: (usePassword) {
                  password = usePassword!.trim();
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).please_enter_you_password;
                  }
                  var validPassword = AppRegex.isPasswordValid(value);
                  if (!validPassword) {
                    return S.of(context).weak_password;
                  }
                  return null;
                },
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
                  onPressed: () {
                    validateMethod(context);
                  }),
              verticalSpace(26),
              HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }

  void validateMethod(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (isTermsAccepted) {
        context.read<SignupCubit>().createUserWithEmailAndPassword(
            email: email, password: password, name: name);
      } else {
        SnackBarHelper.showErrorSnackbar(
            context, S.of(context).please_accept_the_terms_and_conditions);
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
    }
  }
}

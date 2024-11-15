import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helpers/extensions.dart';
import 'package:fruits_app/core/routing/routes.dart';
import 'package:fruits_app/features/auth/presentaion/widgets/signin_view_body.dart';
import '../../../../core/helpers/snack_bar_helper.dart';
import '../../../../generated/l10n.dart';
import '../cubits/signin_cubit/signin_cubit.dart';
import 'custom_progress_hud.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          SnackBarHelper.showSuccessSnackBar(context, S.of(context).login_success);
          context.pushReplacementNamed(Routes.homeScreen);
          print("Success Login");
        }
        if (state is SignInFailure) {
          print(state.message);
          SnackBarHelper.showErrorSnackbar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignInLoading ? true : false,
          child: SignInViewBody(),
        );
      },
    );
  }
}

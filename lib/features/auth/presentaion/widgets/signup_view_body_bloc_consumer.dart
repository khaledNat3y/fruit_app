import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helpers/extensions.dart';
import 'package:fruits_app/core/helpers/snack_bar_helper.dart';
import 'package:fruits_app/features/auth/presentaion/widgets/custom_progress_hud.dart';
import 'package:fruits_app/features/auth/presentaion/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../generated/l10n.dart';
import '../cubits/signup_cubit/signup_cubit.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          context.pop();
          SnackBarHelper.showSuccessSnackBar(context, S.of(context).register_success);
        }
        if (state is SignupFailure) {
          SnackBarHelper.showErrorSnackbar(context, state.message);
        }
      },
      builder: (context, state) {
       return CustomProgressHud(
         isLoading: state is SignupLoading ? true : false,
         child: const SignupViewBody(),
       );
      },
    );
  }
}

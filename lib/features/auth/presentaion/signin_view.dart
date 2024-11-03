import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/services/get_it_service.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_app/features/auth/presentaion/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_app/features/auth/presentaion/widgets/signin_view_body.dart';

import '../../../core/theming/text_styles.dart';
import '../../../generated/l10n.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(context: context, title: S
          .of(context)
          .login,),
      body: BlocProvider(
        create: (context) => SignInCubit(getIt.get<AuthRepo>()),
        child: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SignInViewBody();
          },
        ),
      ),
    );
  }

}

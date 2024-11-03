import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/services/get_it_service.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_app/features/auth/presentaion/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_app/features/auth/presentaion/widgets/signup_view_body.dart';
import 'package:fruits_app/features/auth/presentaion/widgets/signup_view_body_bloc_consumer.dart';

import '../../../generated/l10n.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: S
            .of(context)
            .register,),
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}



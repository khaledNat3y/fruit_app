import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/auth/presentaion/widgets/signup_view_body.dart';

import '../../../generated/l10n.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: S.of(context).register,),
      body: SignupViewBody(),
    );
  }
}

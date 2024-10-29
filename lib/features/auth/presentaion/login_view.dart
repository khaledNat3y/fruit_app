import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/auth/presentaion/widgets/login_view_body.dart';

import '../../../core/theming/text_styles.dart';
import '../../../generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(context: context,title: S.of(context).login,),
      body: LoginViewBody(),
    );
  }

}

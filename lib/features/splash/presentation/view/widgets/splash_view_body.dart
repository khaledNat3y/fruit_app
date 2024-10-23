import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/constant/constant.dart';
import 'package:fruits_app/core/helpers/extensions.dart';
import 'package:fruits_app/core/services/shared_preferences_singleton.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../generated/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashButton, fit: BoxFit.fill,),
      ],
    );
  }
  void executeNavigation() {
    Future.delayed(Duration(seconds: 3), () {
      checkIfUserIsLoggedIn() ? context.pushReplacementNamed(Routes.loginScreen) : context.pushReplacementNamed(Routes.onBoardingScreen);
    });
  }

  bool checkIfUserIsLoggedIn() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    return isOnBoardingViewSeen;
  }
}

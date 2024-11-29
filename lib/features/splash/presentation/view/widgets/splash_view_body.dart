import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/constant/constant.dart';
import 'package:fruits_app/core/helpers/extensions.dart';
import 'package:fruits_app/core/services/firebase_auth_service.dart';
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
    super.initState();
    executeNavigation();
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
            SvgPicture.asset(Assets.svgsPlant),
          ],
        ),
        SvgPicture.asset(Assets.svgsLogo),
        SvgPicture.asset(
          Assets.svgsSplashButton,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void executeNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return; // Check if the widget is still mounted

      if (checkIfUserIsLoggedIn()) {
        var isLoggedIn = FirebaseAuthService().isUserLoggedIn();
        if (isLoggedIn) {
          context.pushReplacementNamed(Routes.homeScreen);
        } else {
          context.pushReplacementNamed(Routes.loginScreen);
        }
      } else {
        context.pushReplacementNamed(Routes.onBoardingScreen);
      }
    });
  }

  bool checkIfUserIsLoggedIn() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    return isOnBoardingViewSeen;
  }
}

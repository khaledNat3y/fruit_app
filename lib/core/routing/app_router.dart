import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/routing/routes.dart';
import 'package:fruits_app/features/auth/presentaion/signin_view.dart';
import 'package:fruits_app/features/auth/presentaion/signup_view.dart';
import 'package:fruits_app/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/home_view.dart';
import 'package:fruits_app/features/on_boarding/presentaion/views/on_boarding_view.dart';
import 'package:fruits_app/features/splash/presentation/view/splash_view.dart';

import '../../features/home/presentation/views/main_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this (arguments as ClassName)
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingView(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const SignInView(),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (context) => const SignupView(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const MainView(),
        );
      case Routes.bestSellingScreen:
        return MaterialPageRoute(
          builder: (context) => const BestSellingView(),
        );
      default:
        return null;
    }
  }
}
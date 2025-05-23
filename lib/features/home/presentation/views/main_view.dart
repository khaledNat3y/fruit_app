import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/theming/app_colors.dart';
import 'package:fruits_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_app/features/home/presentation/views/cart_view.dart';
import 'package:fruits_app/features/home/presentation/views/products_view.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/active_item.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/custom_buttom_navigation_bar.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/home_view.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/main_view_body_bloc_consumer.dart';
import 'package:fruits_app/features/splash/presentation/view/splash_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../generated/l10n.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  List<Widget> pages = const [HomeView(), SplashView(), HomeView(), HomeView()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(onItemTapped: (index) {
          setState(() {
            currentIndex = index;
          });
        },),
        extendBody: true,
        body: SafeArea(child: MainViewBodyBlocConsumer(currentIndex: currentIndex)),
      ),
    );
  }
}





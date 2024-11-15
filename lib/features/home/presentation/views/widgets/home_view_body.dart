import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import '../../../../../core/widgets/search_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomHomeAppBar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchTextField(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/helpers/spacing.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/featured_list.dart';
import '../../../../../core/widgets/fruit_item.dart';
import '../../../../../core/widgets/search_text_field.dart';
import 'best_selling_grid_view.dart';
import 'best_selling_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CustomHomeAppBar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: const SearchTextField(),
              ),
              verticalSpace(12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                    child: const FeaturedList()),
              ),
              verticalSpace(12),
               Padding(
                 padding:  EdgeInsets.all(12.0.w),
                 child: const BestSellingHeader(),
               ),
              verticalSpace(12),
            ],
          ),
        ),
        const BestSellingGridView(),
      ],
    );
  }
}

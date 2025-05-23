import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/cubits/product_cubit/products_cubit.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/search_text_field.dart';
import 'product_grid_view.dart';
import 'products_grid_view_bloc_builder.dart';
import 'best_selling_header.dart';
import 'custom_home_app_bar.dart';
import 'featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }
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
        const ProductsGridViewBlocBuilder(),
      ],
    );
  }
}


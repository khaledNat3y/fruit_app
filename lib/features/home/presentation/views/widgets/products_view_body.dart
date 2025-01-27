import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruits_app/core/widgets/build_app_bar.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/products_view_header.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/search_text_field.dart';
import '../../../../../generated/l10n.dart';
import 'custom_home_app_bar.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              buildAppBar(context, title: S.of(context).products, showBackButton: false),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: const SearchTextField(),
              ),

              verticalSpace(12),
              Padding(
                padding:  EdgeInsets.all(12.0.w),
                child: ProductViewHeader(productLength: context.read<ProductsCubit>().productsLength,),
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

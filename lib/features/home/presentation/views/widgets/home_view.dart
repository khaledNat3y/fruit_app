import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruits_app/core/helpers/spacing.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/featured_list.dart';
import '../../../../../core/repos/product_repo/product_repo.dart';
import '../../../../../core/services/get_it_service.dart';
import '../../../../../core/widgets/fruit_item.dart';
import '../../../../../core/widgets/search_text_field.dart';
import 'product_grid_view.dart';
import 'best_selling_header.dart';
import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child: const HomeViewBody(),
    );
  }
}


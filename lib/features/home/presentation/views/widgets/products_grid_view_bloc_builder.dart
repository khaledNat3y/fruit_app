import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubits/product_cubit/products_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helpers/get_dummy_product.dart';
import 'product_grid_view.dart';
import 'custom_error_widget.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductGridView(products: state.products,);
        } else if (state is ProductsError) {
          if(kDebugMode) {
            print(state.errMessage);
          }
          return SliverToBoxAdapter(child: CustomErrorWidget(errMessage: state.errMessage));
        } else {
          return Skeletonizer.sliver(
            enabled: true,
              child: ProductGridView(products: getDummyProducts(),));
        }
      },
    );
  }
}

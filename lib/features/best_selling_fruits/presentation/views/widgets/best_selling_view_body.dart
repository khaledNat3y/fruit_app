import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/helpers/spacing.dart';
import 'package:fruits_app/core/theming/text_styles.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/product_grid_view.dart';
import 'package:fruits_app/generated/l10n.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Text(
                      S.of(context).best_selling,
                      style: AppStyles.font19Bold,
                    ),
                  )),
              verticalSpace(8),
            ],
          ),
        ),
        const ProductGridView(products: [],),
      ],
    );
  }
}

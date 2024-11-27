import 'package:flutter/material.dart';
import 'package:fruits_app/features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';
import '../../../../core/widgets/build_app_bar.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "الأكثر مبيعا"),
      body: const BestSellingViewBody(),
    );
  }


}

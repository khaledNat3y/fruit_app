import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helpers/snack_bar_helper.dart';
import 'package:fruits_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';

import '../../../../../generated/l10n.dart';
import 'main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if(state is CartItemAdded) {
          SnackBarHelper.showSuccessSnackBar(context, S.of(context).product_successfully_added);
        }
        if(state is CartItemRemoved) {
          SnackBarHelper.showSuccessSnackBar(context, S.of(context).product_successfully_removed);
        }
      },
      child: MainViewBody(currentIndex: currentIndex),
    );
  }
}
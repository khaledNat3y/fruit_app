import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/constant/constant.dart';

import '../../../../../core/widgets/build_app_bar.dart';
import '../../../../../generated/l10n.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import 'cart_header.dart';
import 'cart_item_list.dart';
import 'custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: kTopPadding,
                  ),
                  buildAppBar(
                    context,
                    title: S.of(context).cart,
                    showNotification: false,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CartHeader(productsLength: context.watch<CartCubit>().cartEntity.cartItems.length,),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : const CustomDivider(),
            ),
            CarItemsList(
              carItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : const CustomDivider(),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * .07,
          child: const CustomCartButton(),
        )
      ],
    );
  }
}
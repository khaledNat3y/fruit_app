import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/theming/text_styles.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import '../../../../../generated/assets.dart';
import '../../../domain/entites/cart_item_entity.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import '../../cubits/cart_item_cubit/cart_item_cubit.dart';
import 'cart_item_action_buttons.dart';


class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.carItemEntity});

  final CartItemEntity carItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == carItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 73,
                height: 92,
                decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                child: CustomNetworkImage(
                  imageUrl: carItemEntity.productEntity.imageUrl ?? "",
                ),
              ),
              const SizedBox(
                width: 17,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          carItemEntity.productEntity.name,
                          style: AppStyles.font13Bold,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .deleteCarItem(carItemEntity);
                          },
                          child: SvgPicture.asset(
                            Assets.svgsTrash,
                          ),
                        )
                      ],
                    ),
                    Text(
                      '${carItemEntity.calculateTotalWeight()} كم',
                      textAlign: TextAlign.right,
                      style: AppStyles.font13Regular.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        CartItemActionButtons(
                          cartItemEntity: carItemEntity,
                        ),
                        const Spacer(),
                        Text(
                          '${carItemEntity.calculateTotalPrice()} جنيه ',
                          style: AppStyles.font16Bold
                              .copyWith(color: AppColors.secondaryColor),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
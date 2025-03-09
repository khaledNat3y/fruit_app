import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helpers/snack_bar_helper.dart';
import 'package:fruits_app/core/theming/app_colors.dart';
import 'package:fruits_app/core/theming/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import '../../cubits/cart_item_cubit/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
            } else {
              SnackBarHelper.showErrorSnackbar(
                  context, S.of(context).cart_is_empty);
            }
          },
          buttonText:
              '${S.of(context).payment}  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} ${S.of(context).pound}',
          textStyle: AppStyles.font13Regular.copyWith(color: AppColors.white),
        );
      },
    );
  }
}

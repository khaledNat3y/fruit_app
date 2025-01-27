import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/generated/assets.dart';

import '../../../../../core/theming/text_styles.dart';
import '../../../../../generated/l10n.dart';

class ProductViewHeader extends StatelessWidget {
  final int productLength;
  const ProductViewHeader({super.key, required this.productLength});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$productLength ${S.of(context).results}",
          textAlign: TextAlign.right,
          style: AppStyles.font16Bold.copyWith(color: const Color(0xFF0C0D0D)),
        ),
        GestureDetector(
          onTap: () {
            
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.10000000149011612),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0x66CACECE)),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: SvgPicture.asset(Assets.svgsArrowSwapHorizontal),
          ),
        )
      ],
    );
  }
}

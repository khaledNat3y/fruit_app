import 'package:flutter/material.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class TermsAndConditions extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const TermsAndConditions({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value); // Toggle checkbox when tapping on the entire row
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Transform.scale(
            scale: 1.3,
            child: Checkbox(
              value: value,
              onChanged: (newValue) => onChanged(newValue), // Direct call avoids redundant onChanged
              fillColor: WidgetStateProperty.resolveWith((states) {
                return value ? AppColors.primaryColor : AppColors.white;
              }),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
              side: const BorderSide(color: AppColors.lighterGrey),
            ),
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: S.of(context).by_creating_an_account_you_agree_to,
                style: AppStyles.font15Medium.copyWith(
                  color: AppColors.lightGrey,
                ),
                children: [
                  TextSpan(
                    text: S.of(context).our_terms_and_conditions,
                    style: AppStyles.font15Medium.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

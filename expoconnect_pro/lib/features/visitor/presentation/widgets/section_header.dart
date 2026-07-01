import 'package:flutter/material.dart';
import '../../../../theme/typography.dart';
import '../../../../theme/colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool showSeeAll;
  final VoidCallback? onSeeAll;

  const SectionHeader({
    super.key,
    required this.title,
    this.showSeeAll = false,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTypography.headline4.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        if (showSeeAll)
          GestureDetector(
            onTap: onSeeAll,
            child: Text(
              'See All',
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
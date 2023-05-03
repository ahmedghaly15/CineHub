import 'package:cine_app/core/global/app_colors.dart';
import 'package:cine_app/core/global/app_strings.dart';
import 'package:cine_app/core/global/app_styles.dart';
import 'package:flutter/material.dart';

class SectionTitleAndSeeMore extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const SectionTitleAndSeeMore({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.textStyle19,
          ),
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    AppStrings.seeMore,
                    style: AppStyles.textStyle16.copyWith(
                      color: AppColors.kSecondaryColor,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: AppColors.kSecondaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

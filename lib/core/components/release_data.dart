import 'package:flutter/material.dart';

import '../global/app_styles.dart';

class ReleaseData extends StatelessWidget {
  const ReleaseData({
    super.key,
    required this.color,
    required this.releaseDate,
  });

  final Color color;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        releaseDate.split('-')[0],
        style: AppStyles.textStyle16,
      ),
    );
  }
}

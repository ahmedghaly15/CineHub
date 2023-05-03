import 'package:flutter/material.dart';

import '../global/app_navigation.dart';

class GetBackButton extends StatelessWidget {
  const GetBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => AppNavigation.navigateBack(context),
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 23,
      ),
    );
  }
}

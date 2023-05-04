import 'package:flutter/material.dart';

abstract class AppNavigation {
  static void navigateBack(context) {
    Navigator.pop(context);
  }

  static Route _createRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween<double>(
          begin: 0,
          end: 1,
        );
        final opacityAnimation = tween.animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInExpo,
          ),
        );
        return FadeTransition(
          opacity: opacityAnimation,
          child: child,
        );
      },
    );
  }

  static void navigateTo({
    required BuildContext context,
    required Widget screen,
  }) {
    Navigator.of(context).push(_createRoute(screen));
  }

  static void navigateReplacementTo({
    required BuildContext context,
    required Widget screen,
  }) {
    Navigator.of(context).pushReplacement(_createRoute(screen));
  }

  static void navigateAndFinish({
    required BuildContext context,
    required Widget screen,
  }) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (Route<dynamic> route) => false, // remove all previous routes
    );
  }
}

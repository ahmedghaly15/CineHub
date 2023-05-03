import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/core/global/app_assets.dart';
import '/core/global/app_colors.dart';
import '/core/global/app_navigation.dart';
import '/core/global/app_strings.dart';
import '/core/global/app_styles.dart';
import '/movies/presentation/screens/movies_screen.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    setSystemUIOverlayStyle();

    initFadingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAssets.appLogo),
        AnimatedBuilder(
          animation: slideAnimation,
          builder: (context, _) => SlideTransition(
            position: slideAnimation,
            child: Text(
              AppStrings.splashText,
              style: AppStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.kSecondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  void setSystemUIOverlayStyle() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.kPrimaryColor,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  void initFadingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 20),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(milliseconds: 3500),
      () => AppNavigation.navigateAndFinish(
        context: context,
        screen: const MoviesScreen(),
      ),
    );
  }
}

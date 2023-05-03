import 'package:bloc/bloc.dart';
import 'package:cine_app/core/global/app_strings.dart';
import 'package:cine_app/core/utils/services_locator.dart';
import 'package:cine_app/movies/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/global/app_colors.dart';
import 'core/utils/my_bloc_observer.dart';

/// TODO : See More Popular Movies Screen

/// TODO : See More Top Rated Movies Screen

void main() {
  Bloc.observer = MyBlocObserver();
  ServicesLocator().setupServiceLocator();
  runApp(const CineHub());
}

class CineHub extends StatelessWidget {
  const CineHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.kPrimaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      ),
      home: const SplashScreen(),
    );
  }
}

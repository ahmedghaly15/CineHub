import 'package:cine_app/core/global/app_strings.dart';
import 'package:cine_app/core/utils/services_locator.dart';
import 'package:cine_app/movies/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/global/app_colors.dart';
import 'core/global/app_styles.dart';
import 'core/utils/my_bloc_observer.dart';
import 'movies/presentation/controllers/movie_controller/movies_bloc.dart';
import 'movies/presentation/controllers/movie_controller/movies_events.dart';

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
    return BlocProvider(
      create: (context) => servicesLocator.get<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            titleTextStyle: AppStyles.textStyle19.copyWith(
              fontWeight: FontWeight.w600,
            ),
            elevation: 0,
            backgroundColor: AppColors.kPrimaryColor,
          ),
          scaffoldBackgroundColor: AppColors.kPrimaryColor,
          textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

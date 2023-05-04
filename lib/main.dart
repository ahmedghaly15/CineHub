import 'package:cine_app/core/global/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/global/app_strings.dart';
import '/core/utils/services_locator.dart';
import '/movies/presentation/screens/splash_screen.dart';
import 'core/utils/my_bloc_observer.dart';
import 'movies/presentation/controllers/movie_controller/bloc/movies_bloc.dart';
import 'movies/presentation/controllers/movie_controller/bloc/movies_events.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  ServicesLocator().setupServiceLocator();
  runApp(const CineHubApp());
}

class CineHubApp extends StatelessWidget {
  const CineHubApp({super.key});

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
        theme: appTheme(),
        home: const SplashScreen(),
      ),
    );
  }
}

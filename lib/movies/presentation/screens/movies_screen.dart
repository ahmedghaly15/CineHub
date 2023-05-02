import 'package:cine_app/core/utils/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/movies_screen_components/movies_screen_body.dart';
import '../controllers/movie_controller/movies_bloc.dart';
import '../controllers/movie_controller/movies_events.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicesLocator.get<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: const Scaffold(
        body: MoviesScreenBody(),
      ),
    );
  }
}

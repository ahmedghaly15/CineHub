import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/movie_details_controller/bloc/movie_details_bloc.dart';
import '/core/utils/services_locator.dart';
import '/movies/presentation/components/movie_details_screen_components/movie_details_screen_body.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int id;

  const MovieDetailsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicesLocator.get<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(id))
        ..add(GetMovieRecommendationsEvent(id)),
      child: const Scaffold(
        body: MovieDetailsScreenBody(),
      ),
    );
  }
}

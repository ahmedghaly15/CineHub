import 'package:flutter/material.dart';

import '../../domain/entities/movies.dart';
import '../components/popular_movies_screen_components/popular_movies_screen_body.dart';

class PopularMoviesScreen extends StatelessWidget {
  final List<Movies> movies;
  const PopularMoviesScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopularMoviesScreenBody(movies: movies),
    );
  }
}

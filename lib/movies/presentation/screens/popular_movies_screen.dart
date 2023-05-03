import 'package:flutter/material.dart';

import '../components/popular_movies_screen_components/popular_movies_screen_body.dart';

class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PopularMoviesScreenBody(),
    );
  }
}

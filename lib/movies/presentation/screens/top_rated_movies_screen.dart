import 'package:flutter/material.dart';

import '../components/top_rated_movies_components/top_rated_movies_components_body.dart';

class TopRatedMoviesScreen extends StatelessWidget {
  const TopRatedMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TopRatedMoviesScreenBody(),
    );
  }
}

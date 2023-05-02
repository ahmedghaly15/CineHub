import 'package:cine_app/movies/presentation/components/movie_details_screen_components/movie_details_screen_body.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/dummy.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetailsScreenBody(
        movie: movieDetailDummy,
        recommendations: recommendationsDummy,
      ),
    );
  }
}

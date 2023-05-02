import 'package:animate_do/animate_do.dart';
import 'package:cine_app/movies/presentation/components/movie_details_screen_components/recommendation_movies.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/movie_details.dart';
import '../../../domain/entities/recommendations.dart';
import 'movie_details_section.dart';
import 'movie_image_and_back_button.dart';

class MovieDetailsScreenBody extends StatelessWidget {
  final MovieDetails movie;
  final List<Recommendations> recommendations;

  const MovieDetailsScreenBody({
    Key? key,
    required this.movie,
    required this.recommendations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const Key('movieDetailScrollView'),
      slivers: [
        MovieImageAndBackButton(movie: movie),
        MovieDetailsSection(movie: movie),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
          sliver: SliverToBoxAdapter(
            child: FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: Text(
                'More like this'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ),
        // Tab(text: 'More like this'.toUpperCase()),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
          sliver: RecommendationMovies(recommendations: recommendations),
        ),
      ],
    );
  }
}

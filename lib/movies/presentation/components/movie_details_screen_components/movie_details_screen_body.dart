import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/movie_details_controller/bloc/movie_details_bloc.dart';
import '/core/global/app_strings.dart';
import '/core/global/app_styles.dart';
import '/core/utils/enums.dart';
import '/movies/presentation/components/movie_details_screen_components/recommendation_movies.dart';
import 'movie_details_section.dart';
import 'movie_image_and_back_button.dart';

class MovieDetailsScreenBody extends StatelessWidget {
  const MovieDetailsScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsStates>(
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          case RequestState.loaded:
            return CustomScrollView(
              key: const Key('movieDetailScrollView'),
              slivers: [
                MovieImageAndBackButton(
                  image: state.movieDetails!.backdropPath,
                ),
                MovieDetailsSection(movie: state.movieDetails!),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        AppStrings.moreLikeThis.toUpperCase(),
                        style: AppStyles.textStyle16.copyWith(
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                // Tab(text: 'More like this'.toUpperCase()),
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                  sliver: RecommendationMovies(),
                ),
              ],
            );
          case RequestState.error:
            return Center(
              child: Text(state.movieDetailsErrorMessage),
            );
        }
      },
    );
  }
}

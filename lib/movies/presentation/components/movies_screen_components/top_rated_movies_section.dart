import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_app/core/utils/constants.dart';
import 'package:cine_app/movies/presentation/components/movies_screen_components/shimmer_movies_list_view.dart';
import 'package:cine_app/movies/presentation/screens/movie_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/api_constants.dart';
import '../../controllers/movie_controller/movies_bloc.dart';
import '../../controllers/movie_controller/movies_states.dart';

class TopRatedMoviesSection extends StatelessWidget {
  const TopRatedMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) =>
          previous.topRatedState != current.topRatedState,
      builder: (context, state) {
        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            height: 170.0,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: state.topRatedMovies.length,
              itemBuilder: (context, index) {
                final movie = state.topRatedMovies[index];
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                      navigateTo(
                        context: context,
                        screen: MovieDetailScreen(id: movie.id),
                      );
                    },
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      child: CachedNetworkImage(
                        width: 120.0,
                        fit: BoxFit.cover,
                        imageUrl: ApiConstants.imageUrl(movie.backdropPath),
                        placeholder: (context, url) =>
                            const ShimmerMoviesListView(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

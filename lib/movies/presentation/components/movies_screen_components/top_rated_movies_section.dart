import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/movie_controller/bloc/movies_bloc.dart';
import '../../controllers/movie_controller/bloc/movies_states.dart';
import '/core/components/movie_poster.dart';
import '/core/global/app_navigation.dart';
import '/movies/presentation/screens/movie_details_screen.dart';

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
              itemCount: 5.clamp(0, state.topRatedMovies.length),
              itemBuilder: (context, index) {
                final movie = state.topRatedMovies[index];
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                      AppNavigation.navigateTo(
                        context: context,
                        screen: MovieDetailsScreen(id: movie.id),
                      );
                    },
                    child: MoviePoster(movie: movie),
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

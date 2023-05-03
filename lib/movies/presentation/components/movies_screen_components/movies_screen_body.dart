import 'package:cine_app/core/global/app_navigation.dart';
import 'package:cine_app/core/global/app_strings.dart';
import 'package:cine_app/movies/presentation/controllers/movie_controller/movies_states.dart';
import 'package:cine_app/movies/presentation/screens/popular_movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/movie_controller/movies_bloc.dart';
import 'now_playing_movies_section.dart';
import 'popular_movies_section.dart';
import 'section_title_and_see_more.dart';
import 'top_rated_movies_section.dart';

class MoviesScreenBody extends StatelessWidget {
  const MoviesScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      key: const Key('movieScrollView'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NowPlayingMoviesSection(),
          SectionTitleAndSeeMore(
            title: AppStrings.popular,
            onTap: () {
              AppNavigation.navigateTo(
                context: context,
                screen: BlocBuilder<MoviesBloc, MoviesStates>(
                  builder: (context, state) {
                    return PopularMoviesScreen(movies: state.popularMovies);
                  },
                ),
              );
            },
          ),
          const PopularMoviesSection(),
          SectionTitleAndSeeMore(
            title: AppStrings.topRated,
            onTap: () {},
          ),
          const TopRatedMoviesSection(),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '/core/global/app_navigation.dart';
import '/core/global/app_strings.dart';
import '/movies/presentation/screens/popular_movies_screen.dart';
import '/movies/presentation/screens/top_rated_movies_screen.dart';
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
                screen: const PopularMoviesScreen(),
              );
            },
          ),
          const PopularMoviesSection(),
          SectionTitleAndSeeMore(
            title: AppStrings.topRated,
            onTap: () {
              AppNavigation.navigateTo(
                context: context,
                screen: const TopRatedMoviesScreen(),
              );
            },
          ),
          const TopRatedMoviesSection(),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}

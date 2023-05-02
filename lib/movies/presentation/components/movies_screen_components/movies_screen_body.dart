import 'package:flutter/material.dart';

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
            title: "Popular",
            onTap: () {},
          ),
          const PopularMoviesSection(),
          SectionTitleAndSeeMore(
            title: "Top Rated",
            onTap: () {},
          ),
          const TopRatedMoviesSection(),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}

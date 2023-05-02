import 'package:cine_app/core/utils/services_locator.dart';
import 'package:cine_app/movies/presentation/components/movies_screen_components/section_title_and_see_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/movies_screen_components/now_playing_movies_section.dart';
import '../components/movies_screen_components/popular_movies_section.dart';
import '../components/movies_screen_components/top_rated_movies_section.dart';
import '../controllers/movie_controller/movies_bloc.dart';
import '../controllers/movie_controller/movies_events.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicesLocator.get<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
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
        ),
      ),
    );
  }
}

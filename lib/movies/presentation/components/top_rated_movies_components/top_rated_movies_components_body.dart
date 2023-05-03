import 'package:cine_app/core/global/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/back_button.dart';
import '../../../../core/components/movie_item.dart';
import '../../controllers/movie_controller/movies_bloc.dart';
import '../../controllers/movie_controller/movies_states.dart';

class TopRatedMoviesScreenBody extends StatelessWidget {
  const TopRatedMoviesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const Key('topRatedMoviesScreenScrollView'),
      slivers: <Widget>[
        const SliverAppBar(
          pinned: false,
          title: Text(AppStrings.topRatedMoviesScreenAppBar),
          leading: GetBackButton(),
        ),
        BlocBuilder<MoviesBloc, MoviesStates>(
          builder: (context, state) {
            return SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 10,
                ),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: state.topRatedMovies.length,
                  itemBuilder: (context, index) {
                    return MovieItem(movie: state.topRatedMovies[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 6);
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

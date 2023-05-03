import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/movie_controller/bloc/movies_bloc.dart';
import '../../controllers/movie_controller/bloc/movies_states.dart';
import '/core/components/back_button.dart';
import '/core/components/movie_item.dart';
import '/core/global/app_strings.dart';

class PopularMoviesScreenBody extends StatelessWidget {
  const PopularMoviesScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const Key('popularMoviesScreenScrollView'),
      slivers: <Widget>[
        const SliverAppBar(
          pinned: false,
          title: Text(AppStrings.popularMoviesScreenAppBar),
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
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    return MovieItem(movie: state.popularMovies[index]);
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

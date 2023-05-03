import 'package:flutter/material.dart';

import '../../../../core/components/back_button.dart';
import '../../../domain/entities/movies.dart';
import 'movie_item.dart';

class PopularMoviesScreenBody extends StatelessWidget {
  final List<Movies> movies;
  const PopularMoviesScreenBody({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const Key('popularMoviesScreenScrollView'),
      slivers: [
        const SliverAppBar(
          pinned: false,
          title: Text("Popular Movies"),
          leading: GetBackButton(),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
            ),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MovieItem(movie: movies[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 6);
              },
            ),
          ),
        ),
      ],
    );
  }
}

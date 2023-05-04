import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../movies/domain/entities/movies.dart';
import '../network/api_constants.dart';
import '/core/components/shimmer_movies_list_view.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.movie,
  });

  final Movies movie;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Hero(
        tag: movie.id,
        child: CachedNetworkImage(
          width: 120.0,
          fit: BoxFit.cover,
          imageUrl: ApiConstants.imageUrl(movie.backdropPath),
          placeholder: (context, url) => const ShimmerMoviesListView(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

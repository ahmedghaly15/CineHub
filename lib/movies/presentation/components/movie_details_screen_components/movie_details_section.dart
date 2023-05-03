import 'package:animate_do/animate_do.dart';
import 'package:cine_app/core/global/app_strings.dart';
import 'package:cine_app/core/global/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/release_data.dart';
import '../../../domain/entities/genres.dart';
import '../../../domain/entities/movie_details.dart';

class MovieDetailsSection extends StatelessWidget {
  final MovieDetails movie;
  const MovieDetailsSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FadeInUp(
        from: 20,
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: AppStyles.textStyle24.copyWith(
                  fontSize: 23,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  ReleaseData(
                    releaseDate: movie.releaseDate,
                    color: Colors.grey[800]!,
                  ),
                  const SizedBox(width: 16.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        (movie.voteAverage / 2).toStringAsFixed(1),
                        style: AppStyles.textStyle16.copyWith(
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    _showDuration(movie.runtime),
                    style: AppStyles.textStyle16.copyWith(
                      color: Colors.white70,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                movie.overview,
                style: AppStyles.textStyle14,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8.0),
              Text(
                '${AppStrings.genres}: ${_showGenres(movie.genres)}',
                style: AppStyles.textStyle14.copyWith(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}

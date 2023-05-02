import 'package:cine_app/movies/domain/entities/genres.dart';
import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<Genres> genres;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final int runtime;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genres,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.runtime,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      backdropPath,
      genres,
      overview,
      voteAverage,
      releaseDate,
      runtime,
    ];
  }
}

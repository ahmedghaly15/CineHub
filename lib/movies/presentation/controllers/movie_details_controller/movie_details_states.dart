part of 'movie_details_bloc.dart';

class MovieDetailsStates extends Equatable {
  const MovieDetailsStates({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsErrorMessage = '',
    this.recommendations = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationErrorMessage = '',
  });

  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsErrorMessage;
  final List<Recommendations> recommendations;
  final RequestState recommendationState;
  final String recommendationErrorMessage;

  MovieDetailsStates copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsErrorMessage,
    List<Recommendations>? recommendations,
    RequestState? recommendationState,
    String? recommendationErrorMessage,
  }) {
    return MovieDetailsStates(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsErrorMessage:
          movieDetailsErrorMessage ?? this.movieDetailsErrorMessage,
      recommendations: recommendations ?? this.recommendations,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationErrorMessage:
          recommendationErrorMessage ?? this.recommendationErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsErrorMessage,
        recommendations,
        recommendationState,
        recommendationErrorMessage,
      ];
}

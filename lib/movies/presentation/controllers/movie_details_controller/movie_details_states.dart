part of 'movie_details_bloc.dart';

class MovieDetailsStates extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsErrorMessage;

  const MovieDetailsStates({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsErrorMessage = '',
  });

  MovieDetailsStates copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsErrorMessage,
  }) {
    return MovieDetailsStates(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsErrorMessage:
          movieDetailsErrorMessage ?? this.movieDetailsErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsErrorMessage,
      ];
}

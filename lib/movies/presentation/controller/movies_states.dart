import 'package:equatable/equatable.dart';

import 'package:cine_app/core/utils/enums.dart';
import 'package:cine_app/movies/domain/entities/movies.dart';

class MoviesStates extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingErrorMessage;
  final List<Movies> popularMovies;
  final RequestState popularState;
  final String popularErrorMessage;
  final List<Movies> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedErrorMessage;

  const MoviesStates({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingErrorMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularErrorMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedErrorMessage = '',
  });

  MoviesStates copyWith({
    List<Movies>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingErrorMessage,
    List<Movies>? popularMovies,
    RequestState? popularState,
    String? popularErrorMessage,
    List<Movies>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedErrorMessage,
  }) {
    return MoviesStates(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingErrorMessage:
          nowPlayingErrorMessage ?? this.nowPlayingErrorMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularErrorMessage: popularErrorMessage ?? this.popularErrorMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedErrorMessage: topRatedErrorMessage ?? this.topRatedErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingErrorMessage,
        popularMovies,
        popularState,
        popularErrorMessage,
        topRatedMovies,
        topRatedState,
        topRatedErrorMessage,
      ];
}

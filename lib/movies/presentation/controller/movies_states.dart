import 'package:equatable/equatable.dart';

import 'package:cine_app/core/utils/enums.dart';
import 'package:cine_app/movies/domain/entities/movies.dart';

class MoviesStates extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingErrorMessage;

  const MoviesStates({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingErrorMessage = '',
  });

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingErrorMessage,
      ];
}

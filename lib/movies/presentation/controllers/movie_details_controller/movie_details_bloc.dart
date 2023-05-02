import 'dart:async';

import 'package:cine_app/core/utils/enums.dart';
import 'package:cine_app/movies/domain/entities/movie_details.dart';
import 'package:cine_app/movies/domain/entities/movie_details_parameters.dart';
import 'package:cine_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_details_events.dart';
part 'movie_details_states.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvents, MovieDetailsStates> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase)
      : super(const MovieDetailsStates()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsStates> emit,
  ) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsErrorMessage: failure.message,
          ),
        );
      },
      (movie) {
        emit(
          state.copyWith(
            movieDetails: movie,
            movieDetailsState: RequestState.loaded,
          ),
        );
      },
    );
  }
}

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utils/enums.dart';
import '/movies/domain/entities/movie_details.dart';
import '/movies/domain/entities/movie_details_parameters.dart';
import '/movies/domain/entities/recommendations.dart';
import '/movies/domain/entities/recommendations_parameters.dart';
import '/movies/domain/usecases/get_movie_details_usecase.dart';
import '/movies/domain/usecases/get_recommendations_usecase.dart';

part 'movie_details_events.dart';
part 'movie_details_states.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvents, MovieDetailsStates> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationsUseCase)
      : super(const MovieDetailsStates()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getRecommendations);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationsUseCase getRecommendationsUseCase;

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

  FutureOr<void> _getRecommendations(
    GetMovieRecommendationsEvent event,
    Emitter<MovieDetailsStates> emit,
  ) async {
    final result =
        await getRecommendationsUseCase(RecommendationsParameters(event.id));
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            recommendationState: RequestState.error,
            recommendationErrorMessage: failure.message,
          ),
        );
      },
      (movie) {
        emit(
          state.copyWith(
            recommendations: movie,
            recommendationState: RequestState.loaded,
          ),
        );
      },
    );
  }
}

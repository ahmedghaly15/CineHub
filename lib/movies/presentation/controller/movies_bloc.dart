import 'package:bloc/bloc.dart';
import 'package:cine_app/core/utils/enums.dart';
import 'package:cine_app/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:cine_app/movies/presentation/controller/movies_events.dart';
import 'package:cine_app/movies/presentation/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>(
      (event, emit) async {
        final result = await getNowPlayingMoviesUseCase.execute();
        emit(const MoviesStates(nowPlayingState: RequestState.loaded));

        result.fold(
          (failure) {
            emit(
              MoviesStates(
                nowPlayingState: RequestState.error,
                nowPlayingErrorMessage: failure.message,
              ),
            );
          },
          (movies) {
            emit(
              MoviesStates(
                nowPlayingState: RequestState.loaded,
                nowPlayingMovies: movies,
              ),
            );
          },
        );
      },
    );
  }
}

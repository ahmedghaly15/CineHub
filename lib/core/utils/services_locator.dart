import 'package:cine_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:cine_app/movies/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../movies/data/datasource/base_movies_remote_data_source.dart';
import '../../movies/data/repository/movies_repo_impl.dart';
import '../../movies/domain/repository/movies_repo.dart';
import '../../movies/domain/usecases/get_now_playing_usecase.dart';

// registerLazySingleton: create this when it's used.

// registerSingleton: create this when the function is called, even if this isn't used.

// registerFactory: create new instance of this, it helps in reloading data.

final GetIt servicesLocator = GetIt.instance;

class ServicesLocator {
  void setupServiceLocator() {
    // BLOC
    servicesLocator.registerFactory(
        () => MoviesBloc(servicesLocator.get<GetNowPlayingMoviesUseCase>()));

    // USECASE
    servicesLocator.registerLazySingleton<GetNowPlayingMoviesUseCase>(() {
      return GetNowPlayingMoviesUseCase(servicesLocator.get<MoviesRepo>());
    });

    // REPOSITORY
    servicesLocator.registerLazySingleton<MoviesRepo>(() {
      return MoviesRepoImpl(servicesLocator.get<BaseMoviesRemoteDataSource>());
    });

    // DATA SOURCE
    servicesLocator.registerLazySingleton<BaseMoviesRemoteDataSource>(() {
      return MoviesRemoteDataSource();
    });
  }
}

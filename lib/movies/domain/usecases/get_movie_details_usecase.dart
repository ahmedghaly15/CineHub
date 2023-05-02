import 'package:dartz/dartz.dart';

import 'package:cine_app/core/errors/failure.dart';
import 'package:cine_app/core/usecase/base_usecase.dart';
import 'package:cine_app/movies/domain/entities/movie_details.dart';

import '../entities/movie_details_parameters.dart';
import '../repository/movies_repo.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final MoviesRepo moviesRepo;

  GetMovieDetailsUseCase(this.moviesRepo);

  @override
  Future<Either<Failure, MovieDetails>> call(
    MovieDetailsParameters parameters,
  ) async {
    return await moviesRepo.getMovieDetails(parameters);
  }
}

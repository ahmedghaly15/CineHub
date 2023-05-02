import 'package:cine_app/core/errors/failure.dart';
import 'package:cine_app/core/usecase/base_usecase.dart';
import 'package:cine_app/movies/domain/entities/recommendations_parameters.dart';
import 'package:cine_app/movies/domain/repository/movies_repo.dart';
import 'package:dartz/dartz.dart';

import '../entities/recommendations.dart';

class GetRecommendationsUseCase
    extends BaseUseCase<List<Recommendations>, RecommendationsParameters> {
  final MoviesRepo moviesRepo;

  GetRecommendationsUseCase(this.moviesRepo);

  @override
  Future<Either<Failure, List<Recommendations>>> call(
      RecommendationsParameters parameters) async {
    return await moviesRepo.getRecommendations(parameters);
  }
}

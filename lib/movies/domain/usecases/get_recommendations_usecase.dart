import 'package:dartz/dartz.dart';

import '../entities/recommendations.dart';
import '/core/errors/failure.dart';
import '/core/usecase/base_usecase.dart';
import '/movies/domain/entities/recommendations_parameters.dart';
import '/movies/domain/repository/movies_repo.dart';

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

import 'package:cine_app/movies/domain/entities/recommendations.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({
    super.backdropPath,
    required super.id,
  });

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) {
    return RecommendationsModel(
      backdropPath: json['backdrop_path'] ??
          'https://m.media-amazon.com/images/I/71hfGLNDIKL.jpg',
      id: json['id'],
    );
  }
}

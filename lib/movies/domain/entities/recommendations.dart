import 'package:equatable/equatable.dart';

class Recommendations extends Equatable {
  final String backdropPath;
  final int id;

  const Recommendations({
    required this.backdropPath,
    required this.id,
  });

  @override
  List<Object> get props => [backdropPath, id];
}

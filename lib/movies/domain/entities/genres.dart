import 'package:equatable/equatable.dart';

class Genres extends Equatable {
  final String name;
  final int id;

  const Genres({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [name, id];
}

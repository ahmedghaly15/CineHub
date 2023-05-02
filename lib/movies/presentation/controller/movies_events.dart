import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable {
  const MoviesEvents();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvents {}

class GetPopularMoviesEvent extends MoviesEvents {}

class GetTopRatedMoviesEvent extends MoviesEvents {}

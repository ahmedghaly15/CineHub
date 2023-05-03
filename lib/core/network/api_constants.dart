class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'afca72c3cbf955353383175b47c986a4';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';

  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';

  static String movieDetailsPath(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String recommendationsPath(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  static String imageUrl(String path) => "$baseImageUrl$path";
}

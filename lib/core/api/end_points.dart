class EndPoints {
  static const String baseUrl = 'https://api.themoviedb.org/3/movie/';

  static const String popular = 'popular';

  static String getMovieDetails(int id) {
    return '$baseUrl$id';
  }
}

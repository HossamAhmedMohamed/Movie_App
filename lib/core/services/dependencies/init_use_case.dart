// Use Case

import 'package:movie_app/core/services/service_locater.dart';
import 'package:movie_app/movies/domain/usecases/get_details_movie.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movies.dart';

Future<void> initUseCases() async {
  sl.registerLazySingleton<GetPopularMovies>(
      () => GetPopularMovies(moviesRepository: sl()));

  sl.registerLazySingleton<GetDetailsMovie>(
      () => GetDetailsMovie(moviesRepository: sl()));
}
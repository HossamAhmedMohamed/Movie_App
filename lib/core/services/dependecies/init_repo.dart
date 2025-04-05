// Repository

import 'package:movie_app/core/services/service_locater.dart';
import 'package:movie_app/movies/data/repository/movie_repository_implementation.dart';
import 'package:movie_app/movies/domain/repository/movies_repository.dart';
import 'package:movie_app/movies/presentation/cubit/details_movie_cubit/details_movie_cubit.dart';
import 'package:movie_app/movies/presentation/cubit/popular_movie_cubit/movie_cubit.dart';

Future<void> initRepository() async {
  sl.registerLazySingleton<MoviesRepository>(
      () => MoviesRepositoryImplementation(
            remoteDataSource: sl(),
            localDataSource: sl(),
            networkInfo: sl(),
          ));

  sl.registerFactory<MoviesCubit>(() => MoviesCubit());
  sl.registerFactory<DetailsMovieCubit>(() => DetailsMovieCubit());
}

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/connection/network_info.dart';
import 'package:movie_app/core/services/service_locater.dart';
import 'package:movie_app/movies/data/data_source/local_data_source/local_data_source.dart';
import 'package:movie_app/movies/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository_implementation.dart';
import 'package:movie_app/movies/domain/usecases/get_details_movie.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/movies/presentation/cubit/movie_cubit/movie_state.dart';

class MoviesCubit extends Cubit<MovieState> {
  MoviesCubit() : super(MovieInitial());

  void fetchMovies() async {
    try {
      emit(MovieLoading());
      final movies = GetPopularMovies(
        moviesRepository: MoviesRepositoryImplementation(
            remoteDataSource: RemoteDataSource(sl<Dio>()),
            localDataSource: LocalDataSource(),
            networkInfo:  NetworkInfo()),
      ).getPopularMovies();

      emit(MovieSuccess(movies: await movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  void fetchMovieDetails(int id) async {
    try {
      emit(MovieDetailsLoading());
      final movieDetails = await GetDetailsMovie(
        moviesRepository: MoviesRepositoryImplementation(
            remoteDataSource: RemoteDataSource(sl<Dio>()),
            localDataSource: LocalDataSource(),
            networkInfo: NetworkInfo()),
      ).getGenres(id);
      log('getMovieDetails successsssss');
      emit(MovieDetailsSuccess( movieDetails));
    } catch (e) {
      // emit(MovieDetailsError(e.toString()));
      log(e.toString());
    }
  }
}

import 'dart:developer';

import 'package:movie_app/movies/data/models/genre_model.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

import '../data_source/local_data_source.dart';
import '../data_source/remote_data_source.dart';

class MoviesRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  MoviesRepository({required this.remoteDataSource, required this.localDataSource});

  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final movies = await remoteDataSource.fetchPopularMovies();
      log('${movies.length} moviesRepository');
        localDataSource.cacheMovies(movies);
      return movies;
    } catch (e) {
      return await localDataSource.getCachedMovies();
    }
  }

  Future<List<GenreModel>> getMovieDetails(int id) async {
    try {
      final movieDetails = await remoteDataSource.getMovieDetails(id);
      localDataSource.cacheDetailsMovies(movieDetails );
      return movieDetails;
    } catch (e) {
      return await localDataSource.getDetailsCachedMovies();
      // log('Error: $e');
      // throw Exception('Error: $e');
    }
  }
}

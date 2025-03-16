import 'dart:developer';
import 'package:movie_app/core/connection/network_info.dart';
import 'package:movie_app/movies/data/models/genre_model.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/movies/domain/repository/movies_repository.dart';

import '../data_source/local_data_source/local_data_source.dart';
import '../data_source/remote_data_source/remote_data_source.dart';

class MoviesRepositoryImplementation extends MoviesRepository {
  final NetworkInfo networkInfo;
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  MoviesRepositoryImplementation(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final movies = await remoteDataSource.fetchPopularMovies();
        log('${movies.length} Remote');
        localDataSource.cacheMovies(movies);
        return movies;
      } catch (e) {
        log('Error: $e');
        throw Exception('Error: $e');
      }
    } else {
      try {
        final localMovies = await localDataSource.getCachedMovies();
        log('${localMovies.length} Local');
        return localMovies;
      } catch (e) {
        throw Exception('Error: $e');
      }
    }
  }

  @override
  Future<List<GenreModel>> getMovieDetails(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final movieDetails = await remoteDataSource.getMovieDetails(id);
        localDataSource.cacheDetailsMovies(id, movieDetails);
        return movieDetails;
      } catch (e) {
        log('Error: $e');
        throw Exception('Error: $e');
      }
    } else {
      try {
        final localDetails = await localDataSource.getDetailsCachedMovies(id);
        return localDetails;
      } catch (e) {
        log(e.toString());
        throw Exception('Error: $e');
        
      }
    }
  }
}

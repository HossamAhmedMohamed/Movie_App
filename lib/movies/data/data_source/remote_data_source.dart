import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/movies/data/models/genre_model.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

class RemoteDataSource {
  final Dio dio;

  RemoteDataSource(this.dio);

  Future<List<MovieModel>> fetchPopularMovies() async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular',
        queryParameters: {'api_key': '8949df9b3357ab794fdd741a086f3d05'},
      );

      if (response.statusCode == 200) {
        final List movies = response.data['results'];
        log('${movies.length} movies');

        final List<MovieModel> movieList =
            movies.map((json) => MovieModel.fromJson(json)).toList();
        log('${movies.length} movieList');
        return movieList;
      } else {
        log('Failed to load movies');
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      log('Networkk error: $e');
      throw Exception('Networkkkkkkk error: $e');
    }
  }

  Future<List<GenreModel>> getMovieDetails(int id) async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$id',
        queryParameters: {'api_key': '8949df9b3357ab794fdd741a086f3d05'},
      );

      if (response.statusCode == 200) {
        final movieDetail = response.data;

         
        final List<GenreModel> genres = (movieDetail['genres'] as List)
            .map((genre) => GenreModel.fromJson(genre))
            .toList();

        log('Extracted genres: ${genres.map((e) => e.name).toList()}');
        return genres;
      } else {
        log('Failed to load movie genres');
        throw Exception('Failed to load movie genres');
      }
    } catch (e) {
      log('Network errooor: $e');
      throw Exception('Network error: $e');
    }
  }
}

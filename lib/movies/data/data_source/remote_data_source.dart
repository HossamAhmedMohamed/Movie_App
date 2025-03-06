import 'dart:developer';

import 'package:dio/dio.dart';
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

  Future<dynamic> getMovieDetails(int id) async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$id',
        queryParameters: {'api_key': '8949df9b3357ab794fdd741a086f3d05'},
      );

      if (response.statusCode == 200) {
        final movieDetail = response.data;
        log('Movie details: $movieDetail');
        return movieDetail;
      } else {
        log('Failed to load movie details');
        throw Exception('Failed to load movie details');
      }
    } catch (e) {
      log('Network error: $e');
      throw Exception('Network error: $e');
    }
  }
}

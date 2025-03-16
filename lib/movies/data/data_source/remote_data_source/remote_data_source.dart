import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/core/api/end_points.dart';
import 'package:movie_app/core/constants/keys.dart';
import 'package:movie_app/movies/data/models/genre_model.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

class RemoteDataSource {
  final Dio dio;

  RemoteDataSource(this.dio) {
    dio.options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
    );
  }

  Future<List<MovieModel>> fetchPopularMovies() async {
    final response = await dio.get(
      EndPoints.popular,
      queryParameters: {'api_key': Keys.apiKey},
    );

    final List movies = response.data['results'];
    log('${movies.length} movies');

    final List<MovieModel> movieList =
        movies.map((json) => MovieModel.fromJson(json)).toList();
    log('${movies.length} movieList');
    return movieList;
  }

  Future<List<GenreModel>> getMovieDetails(int id) async {
    final response = await dio.get(
      EndPoints.getMovieDetails(id),
      queryParameters: {'api_key': Keys.apiKey},
    );

    final movieDetail = response.data;

    final List<GenreModel> genres = (movieDetail['genres'] as List)
        .map((genre) => GenreModel.fromJson(genre))
        .toList();

    log('Extracted genres: ${genres.map((e) => e.name).toList()}');
    return genres;
  }
}

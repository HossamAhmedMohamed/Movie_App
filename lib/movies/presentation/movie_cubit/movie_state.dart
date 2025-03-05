

import 'package:movie_app/movies/data/models/movie_model.dart';

sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieSuccess extends MovieState {
  final List<MovieModel> movies;

  MovieSuccess(this.movies);
}

final class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}

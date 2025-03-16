import 'package:movie_app/movies/data/models/genre_model.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';

sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieSuccess extends MovieState {
  final List<MovieEntity> movies;

  MovieSuccess({required this.movies});
}

final class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}

final class MovieDetailsLoading extends MovieState {}

final class MovieDetailsSuccess extends MovieState {
  final List<GenreModel> movieDetails;

  MovieDetailsSuccess(this.movieDetails);
}

final class MovieDetailsError extends MovieState {
  final String message;

  MovieDetailsError(this.message);
}

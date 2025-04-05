 
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



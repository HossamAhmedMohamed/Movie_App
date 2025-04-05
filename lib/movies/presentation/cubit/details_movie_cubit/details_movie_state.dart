part of 'details_movie_cubit.dart';

sealed class DetailsMovieState   {}

final class DetailsMovieInitial extends DetailsMovieState {}

final class MovieDetailsLoading extends DetailsMovieState {}

final class MovieDetailsSuccess extends DetailsMovieState {
  final List<GenreModel> movieDetails;

  MovieDetailsSuccess(this.movieDetails);
}

final class MovieDetailsError extends DetailsMovieState {
  final String message;

  MovieDetailsError(this.message);
}
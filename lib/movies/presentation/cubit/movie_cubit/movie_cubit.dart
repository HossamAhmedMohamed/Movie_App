import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';
import 'package:movie_app/movies/presentation/cubit/movie_cubit/movie_state.dart';

class MoviesCubit extends Cubit<MovieState> {
  final MoviesRepository repository;

  MoviesCubit(this.repository) : super(MovieInitial());

  void fetchMovies() async {
    try {
      emit(MovieLoading());
      final List<MovieModel> movies = await repository.getPopularMovies();
      log('${movies.length} moviesCubit');
      emit(MovieSuccess(movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }

    // emit(movies);
  }

  void fetchMovieDetails(int id) async {
    try {
      emit(MovieDetailsLoading());
      final movieDetails = await repository.getMovieDetails(id);
      emit(MovieDetailsSuccess(movieDetails));
    } catch (e) {
      emit(MovieDetailsError(e.toString()));
    }
  }
}

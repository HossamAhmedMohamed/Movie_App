 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/service_locater.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/movies/presentation/cubit/popular_movie_cubit/movie_state.dart';

class MoviesCubit extends Cubit<MovieState> {
  MoviesCubit() : super(MovieInitial());

  void fetchMovies() async {
    try {
      emit(MovieLoading());
      final movies = sl<GetPopularMovies>().getPopularMovies();

      emit(MovieSuccess(movies: await movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  
}
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/service_locater.dart';
import 'package:movie_app/movies/data/models/genre_model.dart';
import 'package:movie_app/movies/domain/usecases/get_details_movie.dart';
part 'details_movie_state.dart';

class DetailsMovieCubit extends Cubit<DetailsMovieState> {
  DetailsMovieCubit() : super(DetailsMovieInitial());



  void fetchMovieDetails(int id) async {
    try {
      emit(MovieDetailsLoading());
      final movieDetails =  sl<GetDetailsMovie>().getGenres(id);
      log('getMovieDetails successsssss');
      emit(MovieDetailsSuccess(await movieDetails));
    } catch (e) {
      emit(MovieDetailsError(e.toString()));
    }
  }
}

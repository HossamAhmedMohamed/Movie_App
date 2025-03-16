import 'package:movie_app/movies/data/models/genre_model.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';

abstract class MoviesRepository {
  Future<List<MovieEntity>> getPopularMovies();

  Future<List<GenreModel>> getMovieDetails(int id);
}

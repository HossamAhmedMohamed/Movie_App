import 'package:movie_app/movies/data/models/genre_model.dart';
import 'package:movie_app/movies/domain/repository/movies_repository.dart';

class GetDetailsMovie {
  final MoviesRepository moviesRepository;
  GetDetailsMovie({required this.moviesRepository});

  Future<List<GenreModel>> getGenres(int id) {
    return moviesRepository.getMovieDetails(id);
  }
}

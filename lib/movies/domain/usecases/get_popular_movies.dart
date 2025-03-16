// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movie_app/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/movies/domain/repository/movies_repository.dart';

class GetPopularMovies {
  MoviesRepository moviesRepository;
  GetPopularMovies({
    required this.moviesRepository,
  });

  Future<List<MovieEntity>> getPopularMovies(){
    return moviesRepository.getPopularMovies();
  }
}

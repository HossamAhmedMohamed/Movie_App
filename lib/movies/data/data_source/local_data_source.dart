import 'package:hive/hive.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

class LocalDataSource {
  Future<void> cacheMovies(List<MovieModel> movies) async {
    final box = await Hive.openBox<MovieModel>('moviesBox');
    await box.clear();
    box.addAll(movies);
  }

  Future<List<MovieModel>> getCachedMovies() async {
    final box = await Hive.openBox<MovieModel>('moviesBox');
    return box.values.toList();
  }
}

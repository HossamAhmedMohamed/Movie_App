import 'package:hive/hive.dart';
import 'package:movie_app/movies/data/models/genre_model.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

class LocalDataSource {
  Future<void> cacheMovies(List<MovieModel>? movies) async {
    if (movies != null) {
      final box = await Hive.openBox<MovieModel>('moviesBox');
      await box.clear();
      box.addAll(movies);
    } else {
      throw Exception("No Internet Connection");
    }
  }

  Future<List<MovieModel>> getCachedMovies() async {
    final dynamic box = await Hive.openBox<MovieModel>('moviesBox');

    if (box != null) {
      return box.values.toList();
    } else {
      throw Exception("No Internet Connection");
    }
  }

  Future<void> cacheDetailsMovies(
      int movieId, List<GenreModel>? detailsMovies) async {
    if (detailsMovies != null) {
      final box = await Hive.openBox<List<GenreModel>>('moviesDetailsBox');
      await box.put(
          movieId.toString(), detailsMovies); // تخزين بناءً على movieId
    } else {
      throw Exception("No Internet Connection");
    }
  }

  Future<List<GenreModel>> getDetailsCachedMovies(int movieId) async {
    final box = await Hive.openBox<List>('moviesDetailsBox');
    return (box.get(movieId.toString(), defaultValue: []) as List)
        .cast<GenreModel>();
  }
}

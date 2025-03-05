import 'package:hive/hive.dart';

part 'hive_adapter.g.dart';

@HiveType(typeId: 0)
class Movie extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  Movie({required this.id, required this.title, required this.posterPath});
}

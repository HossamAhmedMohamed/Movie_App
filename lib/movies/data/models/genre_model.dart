import 'package:hive/hive.dart';

part 'genre_model.g.dart';  

@HiveType(typeId: 3)
class GenreModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  GenreModel({required this.id, required this.name});

   
  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }

   
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

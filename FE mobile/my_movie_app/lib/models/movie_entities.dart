import 'package:hive/hive.dart';

import 'movie.dart';

part 'movie_entities.g.dart'; // File sẽ được tự động tạo

@HiveType(typeId: 0)
class MovieEntities {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? director;

  @HiveField(3)
  final int? year;

  @HiveField(4)
  final String? url;

  @HiveField(5)
  final String? image;

  @HiveField(6)
  final String? description;

  @HiveField(7)
  final List<String>? types;

  MovieEntities({
    this.id,
    this.title,
    this.director,
    this.year,
    this.url,
    this.image,
    this.description,
    this.types = const [],
  });

  // Chuyển đổi từ MovieEntities sang Movie
  Movie toMovie() {
    return Movie(
      id: this.id ?? 0, // Nếu null, gán giá trị mặc định
      title: this.title ?? '',
      director: this.director ?? '',
      year: this.year,
      url: this.url ?? '',
      image: this.image ?? '',
      description: this.description ?? '',
      types: this.types ?? [],
    );
  }
}

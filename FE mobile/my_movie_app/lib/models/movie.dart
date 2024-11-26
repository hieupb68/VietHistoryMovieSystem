import 'movie_entities.dart';

class Movie {
  final int id;
  final String title;
  final String director;
  final int? year;
  final String url;
  final String image;
  final String description;
  final List<String>? types;

  Movie({
    required this.id,
    required this.title,
    required this.director,
    this.year,
    required this.url,
    required this.image,
    required this.description,
    this.types = const [],
  });

  String convertGoogleDriveUrl() {
    final uri = Uri.parse(this.url);

    if (uri.path.contains('/file/d/')) {
      final parts = uri.path.split('/');
      final idIndex = parts.indexOf('d') + 1;
      if (idIndex < parts.length) {
        final id = parts[idIndex];
        return 'https://drive.google.com/uc?export=view&id=$id';
      }
    }
    return url;
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      director: json['director'] as String,
      year: json['year'] as int?,
      url: json['url'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      types: (json['types'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'director': director,
      'year': year,
      'url': url,
      'image': image,
      'description': description,
      'types': types,
    };
  }

  // Chuyển đổi từ Movie sang MovieEntities
  MovieEntities toMovieEntities() {
    return MovieEntities(
      id: this.id,
      title: this.title,
      director: this.director,
      year: this.year,
      url: this.url,
      image: this.image,
      description: this.description,
      types: this.types,
    );
  }
}

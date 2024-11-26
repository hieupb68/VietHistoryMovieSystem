import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_movie_app/models/movie_entities.dart';


class HiveService {
  static final HiveService _instance = HiveService._internal();
  late Box<MovieEntities> favoriteBox;

  factory HiveService() {
    return _instance;
  }

  HiveService._internal();

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MovieEntitiesAdapter());
    favoriteBox = await Hive.openBox<MovieEntities>('favorites');
  }

  // Save a new favorite movie
  Future<void> saveFavorite(MovieEntities movie) async {
    await favoriteBox.put(movie.id, movie); // Lưu với key là id của movie
  }

  // Delete a favorite movie
  Future<void> deleteFavorite(int movieId) async {
    if (favoriteBox.containsKey(movieId)) {
      await favoriteBox.delete(movieId); // Xóa nếu tồn tại
      print('Deleted movie with ID: $movieId');
    } else {
      print('Movie with ID: $movieId does not exist in favorites.');
    }
  }

  // Update a favorite movie
  Future<void> updateFavorite(MovieEntities movie) async {
    if (favoriteBox.containsKey(movie.id)) {
      await favoriteBox.put(movie.id, movie); // Ghi đè lại dữ liệu cũ
    }
  }

  // Get all favorite movies
  List<MovieEntities> getAllFavorites() {
    return favoriteBox.values.toList();
  }

  // Check if a movie is in favorites
  bool isFavorite(int movieId) {
    return favoriteBox.containsKey(movieId);
  }

  Future<void> closeBox() async {
    await favoriteBox.close(); // Đóng Box khi không còn cần dùng
  }
}

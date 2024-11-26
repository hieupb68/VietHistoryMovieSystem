import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_movie_app/models/movie.dart';

class ApiService {
  static const String baseUrl = "http://localhost:8080/api";

  // Đăng ký tài khoản mới
  static Future<bool> register(String username, String password) async {
    try {
      final url = Uri.parse("$baseUrl/auth/register");
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );
      return response as bool ?? false;
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }

  // Xóa tài khoản
  static Future<http.Response> deleteUser(String id) async {
    try {
      final url = Uri.parse("$baseUrl/auth/delete/$id");
      final response = await http.delete(url);
      return response;
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }

  // Lấy thông tin tài khoản
  static Future<http.Response> getUser() async {
    try {
      final url = Uri.parse("$baseUrl/auth/user");
      final response = await http.get(url);
      return response;
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  // Đăng nhập
  static Future<bool> login(String username, String password) async {
    try {
      // final url = Uri.parse("$baseUrl/auth/login");
      // final response = await http.post(
      //   url,
      //   headers: {'Content-Type': 'application/json'},
      //   body: jsonEncode({'username': username, 'password': password}),
      // );
      return true;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  // Đăng nhập với Google
  static Future<http.Response> loginWithGoogle(String token) async {
    try {
      final url = Uri.parse("$baseUrl/auth/login/google");
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': token}),
      );
      return response;
    } catch (e) {
      throw Exception('Failed to login with Google: $e');
    }
  }

  // Thêm phim mới
  static Future<http.Response> addMovie(
      String title, String description, String genre, String director, int year) async {
    try {
      final url = Uri.parse("$baseUrl/movies");
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': title,
          'description': description,
          'genre': genre,
          'director': director,
          'year': year,
        }),
      );
      return response;
    } catch (e) {
      throw Exception('Failed to add movie: $e');
    }
  }

  // Lấy tất cả phim
  static Future<List<Movie>> getAllMovies() async {
    try {
      final url = Uri.parse("$baseUrl/movies");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }

  // Lấy phim theo ID
  static Future<Movie> getMovieById(String id) async {
    try {
      final url = Uri.parse("$baseUrl/movies/$id");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        return Movie.fromJson(jsonData);
      } else {
        throw Exception('Failed to load movie: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load movie: $e');
    }
  }

  // Thêm loại phim mới
  static Future<http.Response> addType(String name) async {
    try {
      final url = Uri.parse("$baseUrl/types");
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name}),
      );
      return response;
    } catch (e) {
      throw Exception('Failed to add type: $e');
    }
  }

  // Lấy tất cả loại phim
  static Future<http.Response> getAllTypes() async {
    try {
      final url = Uri.parse("$baseUrl/types");
      final response = await http.get(url);
      return response;
    } catch (e) {
      throw Exception('Failed to get all types: $e');
    }
  }

  // Thêm phản hồi mới
  static Future<http.Response> addFeedback(String filmId, String content) async {
    try {
      final url = Uri.parse("$baseUrl/feedbacks");
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'filmId': filmId, 'content': content}),
      );
      return response;
    } catch (e) {
      throw Exception('Failed to add feedback: $e');
    }
  }

  // Lấy phản hồi theo ID phim
  static Future<http.Response> getFeedbackByFilmId(String filmId) async {
    try {
      final url = Uri.parse("$baseUrl/feedbacks/$filmId");
      final response = await http.get(url);
      return response;
    } catch (e) {
      throw Exception('Failed to get feedback by film ID: $e');
    }
  }
  static Future<List<Movie>> searchMovies(String keyword) async {
    final url = Uri.parse('http://localhost:8080/api/movie/get?keyword=$keyword');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> moviesJson = data['content'];
        return moviesJson.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }
  static Future<List<Movie>> fetchMoviesByType(int typeId) async {
    final url = Uri.parse('http://localhost:8080/api/movie/get?typeId=$typeId');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> moviesJson = data['content'];
        return moviesJson.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }
}

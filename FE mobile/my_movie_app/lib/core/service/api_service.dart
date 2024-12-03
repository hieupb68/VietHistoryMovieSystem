import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_movie_app/comon/data/data_page_response.dart';
import 'package:my_movie_app/models/feedback.dart';
import 'package:my_movie_app/models/movie.dart';

class ApiService {
  static const String baseUrl = "http://192.168.229.1:8080/api";

  // // Register a new account
  // static Future<bool> register(String username, String password) async {
  //   try {
  //     final url = Uri.parse("$baseUrl/auth/register");
  //     final response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({'username': username, 'password': password}),
  //     );
  //     return response.statusCode == 200;
  //   } catch (e) {
  //     throw Exception('Failed to register: $e');
  //   }
  // }

  // Delete a user
  static Future<void> deleteUser(String id) async {
    try {
      final url = Uri.parse("$baseUrl/auth/delete/$id");
      final response = await http.delete(url);

      if (response.statusCode != 200) {
        throw Exception('Failed to delete user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }

  // Get user information
  static Future<Map<String, dynamic>> getUser() async {
    try {
      final url = Uri.parse("$baseUrl/auth/user");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }
  //
  // // Login
  // static Future<bool> login(String username, String password) async {
  //   try {
  //     final url = Uri.parse("$baseUrl/auth/login");
  //     final response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({'username': username, 'password': password}),
  //     );
  //     return response.statusCode == 200;
  //   } catch (e) {
  //     throw Exception('Failed to login: $e');
  //   }
  // }

  // Lấy tất cả phim

  static Future<List<Movie>> getAllMovies() async {
    try {
      final url = Uri.parse("$baseUrl/movie/getAll");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        final jsonData = jsonDecode(decodedBody) as List<dynamic>;

        return jsonData.map((movieJson) => Movie.fromJson(movieJson)).toList();
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }

  // Fetch movies by type with pagination
  static Future<BasePageData<Movie>> fetchMoviesByType(int typeId, {int page = 0, int size = 10}) async {
    try {
      final url = Uri.parse("$baseUrl/movie/get?typeId=$typeId&page=$page&size=$size");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        return BasePageData<Movie>.fromJson(
          jsonData,
              (item) => Movie.fromJson(item),
        );
      } else {
        throw Exception('Failed to fetch movies by type: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies by type: $e');
    }
  }

  // Get movie by ID
  static Future<Movie> getMovieById(String id) async {
    try {
      final url = Uri.parse("$baseUrl/movies/$id");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return Movie.fromJson(jsonData);
      } else {
        throw Exception('Failed to fetch movie by ID: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch movie by ID: $e');
    }
  }

  // Search movies with pagination
  static Future<BasePageData<Movie>> searchMovies(String keyword, {int page = 1, int size = 12}) async {
    try {
      final url = Uri.parse("$baseUrl/movie/get?keyword=$keyword&page=$page&size=$size");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        return BasePageData<Movie>.fromJson(
          jsonData,
              (item) => Movie.fromJson(item),
        );
      } else {
        throw Exception('Failed to search movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error searching movies: $e');
    }
  }

  ///
  static Future<List<FeedbackModel>> getFeedbackForMovie(int filmId) async {
    final response = await http.get(Uri.parse('$baseUrl/feedback/get?filmId=$filmId'));

    if (response.statusCode == 200) {
      List<dynamic> feedbackJson = json.decode(response.body);
      // Map the JSON data to a list of Feedback objects
      return feedbackJson.map((feedback) => FeedbackModel.fromJson(feedback)).toList()??[];
    } else {
      throw Exception('Failed to load feedback');
    }
  }

  static Future<String> getResponse(String userMessage) async {
    final url = Uri.parse('http://192.168.229.1:8000/response');

    // The body of the requesthi
    final body = jsonEncode({
      'messages': [
        {
          'role': 'user',
          'content': userMessage,
        }
      ]
    });

    // Sending the POST request
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        // If the server responds with a 200 OK, parse the response
        final responseData = jsonDecode(response.body);
        // Return the assistant message from the response
        return responseData['assistant_message'];
      } else {
        // If the server doesn't respond with 200, throw an error
        throw Exception('Failed to load response');
      }
    } catch (error) {
      // Handle network errors or other exceptions
      return 'Error: $error';
    }
  }

  // Login API
  static Future<User?> login(String username, String password) async {
    final url = Uri.parse("$baseUrl/authen/login");
    final headers = {"Content-Type": "application/json"};
    final body = json.encode({"username": username, "password": password});

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final userData = responseData['user'];
        return User.fromJson(userData);
      } else {
        return null;
        // throw Exception("Login failed: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to login: $e");
    }
  }

  static Future<bool> register(String username, String password) async {
    final url = Uri.parse("$baseUrl/authen/register");
    final headers = {
      "Content-Type": "application/json",
    };
    final body = json.encode({"username": username, "password": password});

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true; // Success
      } else {
        print("Register failed: ${response.statusCode}");
        return false; // Failed
      }
    } catch (e) {
      print("Failed to register: $e");
      return false; // Error occurred
    }
  }
}

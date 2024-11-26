import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  StorageService._internal();

  static final _instance = StorageService._internal();

  factory StorageService() => _instance;

  // Getter để truy cập SharedPreferences
  static Future<SharedPreferences> get preferences async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }

  // Ví dụ về cách lưu trữ giá trị vào SharedPreferences
  static Future<void> saveString(String key, String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

  // Ví dụ về cách truy xuất giá trị từ SharedPreferences
  static Future<String> getString(String key,
      {String defaultValue = ''}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? defaultValue;
  }

  // Ví dụ về cách xóa một giá trị từ SharedPreferences
  static Future<void> remove(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }

  // Ví dụ về cách xóa toàn bộ SharedPreferences
  static Future<void> clear() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}

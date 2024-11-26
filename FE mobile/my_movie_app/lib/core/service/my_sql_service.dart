import 'package:mysql1/mysql1.dart';

class MySQLService {
  // Cấu hình kết nối
  final _settings = ConnectionSettings(
    host: 'your_host',       // Địa chỉ máy chủ MySQL (VD: localhost hoặc IP)
    port: 3306,              // Cổng mặc định của MySQL
    user: 'your_user',       // Tên đăng nhập MySQL
    password: 'your_password', // Mật khẩu MySQL
    db: 'your_database',     // Tên cơ sở dữ liệu
  );

  // Hàm kết nối đến cơ sở dữ liệu
  Future<MySqlConnection> _connect() async {
    return await MySqlConnection.connect(_settings);
  }

  // Hàm thực hiện truy vấn SELECT
  Future<List<Map<String, dynamic>>> query(String sql, [List<Object?>? params]) async {
    try {
      final conn = await _connect();
      final results = await conn.query(sql, params);

      // Chuyển đổi kết quả thành danh sách Map
      final List<Map<String, dynamic>> rows = results
          .map((row) => Map<String, dynamic>.fromEntries(
          row.fields.map((key, value) => MapEntry(key, value)) as Iterable<MapEntry<String, dynamic>>))
          .toList();

      await conn.close();
      return rows;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  // Hàm thực hiện các truy vấn INSERT, UPDATE, DELETE
  Future<int> execute(String sql, [List<Object?>? params]) async {
    try {
      final conn = await _connect();
      final result = await conn.query(sql, params);
      await conn.close();
      return result.affectedRows!;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}

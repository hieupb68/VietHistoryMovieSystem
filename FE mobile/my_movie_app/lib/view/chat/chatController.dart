import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatController extends GetxController {
  // Danh sách tin nhắn (RxList để tự động cập nhật UI)
  var messages = <String>[].obs;
  TextEditingController msgController = TextEditingController();

  // URL API
  final String baseUrl = 'https://1ddb-14-191-36-197.ngrok-free.app';

  // Gửi tin nhắn và nhận phản hồi từ server
  Future<void> sendMessage(String message) async {
    if (message.trim().isNotEmpty) {
      // Thêm tin nhắn người dùng vào danh sách
      messages.add("$message");
      msgController.clear(); // Xóa trường nhập liệu

      try {
        // Gửi yêu cầu POST để gửi tin nhắn
        final response = await http.post(
          Uri.parse('$baseUrl/response'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "messages": [
              {"role": "user", "content": message}
            ]
          }),
        );

        // Nếu gửi thành công, thực hiện GET để lấy phản hồi
        if (response.statusCode == 200) {
          await _getAssistantMessage();
        } else {
          messages.add("Lỗi server (POST): ${response.statusCode}");
        }
      } catch (e) {
        messages.add("Không thể kết nối tới server: $e");
      }
    }
  }

  // Lấy phản hồi từ server qua GET
  Future<void> _getAssistantMessage() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/response'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        final assistantMessage = jsonData['assistant_message'] ?? "Không nhận được phản hồi.";
        messages.add("$assistantMessage");
      } else {
        messages.add("Lỗi server (GET): ${response.statusCode}");
      }
    } catch (e) {
      messages.add("Không thể lấy phản hồi từ server: $e");
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  // Danh sách tin nhắn (dùng RxList để tự động cập nhật UI)
  var messages = <String>[].obs;
  TextEditingController msgController = TextEditingController();

  // Thêm tin nhắn mới
  void sendMessage(String message) {
    if (message.trim().isNotEmpty) {
      messages.add(message);
      Future.delayed(const Duration(milliseconds: 100));
      messages.add("Đất phương Nam là một bộ phim ngắn tập chính kịch phiêu lưu Việt Nam năm 1997 do Nguyễn Vinh Sơn làm đạo diễn kiêm viết kịch bản. Bộ phim dựa trên tiểu thuyết Đất rừng phương Nam của nhà văn Đoàn Giỏi, kể về hành trình tìm cha của một cậu bé ở vùng Tây Nam Bộ. ");
    }
  }
}

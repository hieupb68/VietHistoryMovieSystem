import 'package:get/get.dart';
import 'package:my_movie_app/view/chat/chatController.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}
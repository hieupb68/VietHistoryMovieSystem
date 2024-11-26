import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie_app/comon/widget/textfield_custom.dart';
import 'package:my_movie_app/view/chat/chatController.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatController chatController = Get.put(ChatController());

  final TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollToEnd();
  }

  void _scrollToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent +
              50.0, // Thêm một chút dịch
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
    _scrollController.dispose(); // Hủy ScrollController khi không sử dụng
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26, // Màu shadow
            offset: Offset(0, 4), // Vị trí shadow (x, y)
            blurRadius: 10, // Độ mờ của shadow
            spreadRadius: 2, // Độ lan của shadow
          ),
        ],
        borderRadius: BorderRadius.circular(12), // Tùy chỉnh nếu muốn bo góc
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight * 3 / 5),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
              child: AppBar(
                title: const Text('Chat bot'),
                titleTextStyle: TextStyle(fontSize: 12),
                backgroundColor: Colors.blueGrey,
              ),
            ),
          ),
          body: Column(
            children: [
              // Danh sách tin nhắn
              Expanded(
                child: Obx(
                  () {
                    _scrollToEnd();
                    return ListView.builder(
                            controller:
                                _scrollController, // Gán ScrollController
                            padding: const EdgeInsets.all(10),
                            itemCount: chatController.messages.length,
                            itemBuilder: (context, index) {
                              final message = chatController.messages[index];
                              return Align(
                                alignment: index % 2 != 0
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: Container(
                                  width: Get.width * 4 / 7,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? Colors.blue[100]
                                        : Colors.green[100],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    message,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              );
                            },
                          );
                  },
                ),
              ),
              // Ô nhập tin nhắn
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Row(
                  children: [
                    // TextField
                    Expanded(
                      child: CustomTextField(
                        controller: messageController,
                        hintText: 'enter_question'.tr,
                        textStyle: TextStyle(fontSize: 10),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Nút gửi
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.blue),
                      onPressed: () {
                        chatController.sendMessage(messageController.text);
                        messageController.clear(); // Xóa text sau khi gửi
                        // Cuộn đến tin nhắn cuối cùng
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent + 50,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

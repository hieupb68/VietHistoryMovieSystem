import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/shareController.dart';
import 'package:my_movie_app/view/chat/chatPage.dart';
import 'package:my_movie_app/view/homePage/homeController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Get.put(HomeController());
  final ShareController shareController = Get.put(ShareController());

  bool _isShowChatBot = false;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kTextTabBarHeight),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1), // Màu bóng (mờ 30%)
                offset: const Offset(0, 2), // Bóng dọc xuống 4px
                blurRadius: 6.0,
              ),
            ]),
            child: AppBar(
                // backgroundColor: Colors.white,
                title: Text(
                  homeController
                      .titleString[homeController.selectedIndex.value],
                  style: const TextStyle(
                    // color: Color(0xFF2970E4),
                    fontFamily: "ComicSansMS",
                    fontSize: 22,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                actions: [
                  InkWell(
                      onTap: () => shareController.changeLanguage(),
                      child: SvgPicture.asset(
                        shareController.icon.value,
                        height: 24,
                        fit: BoxFit.contain,
                      )),
                  IconButton(
                    icon: const Icon(Icons.brightness_6),
                    onPressed: () {
                      // Chuyển đổi chế độ sáng/tối
                      shareController.changeDarkMode();
                    },
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ]),
          ),
        ),
        floatingActionButton: InkWell(
            onTap: () {
              setState(() {
                _isShowChatBot = !_isShowChatBot;
              });
            },
            child: SvgPicture.asset('assets/svg/chat.svg')),
        body: Stack(
          children: [
            homeController.pages[homeController.selectedIndex.value],
            Visibility(
              visible: _isShowChatBot,
              child: Positioned(
                  bottom: 40,
                  right: 40,
                  height: Get.height * 3 / 5,
                  width: Get.width * 4 / 5,
                  child: Container(

                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      )),
                      child: ChatScreen())),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          currentIndex: homeController.selectedIndex.value,
          onTap: homeController.changeTab,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          items:  [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_outlined),
              label: 'category'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'search'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'favourite'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile'.tr,
            ),
          ],
        ),
      ),
    );
  }
}

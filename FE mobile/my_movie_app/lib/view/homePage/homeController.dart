
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie_app/view/category/categoryPage.dart';
import 'package:my_movie_app/view/favourite/favouriteController.dart';
import 'package:my_movie_app/view/favourite/favouritePage.dart';
import 'package:my_movie_app/view/homePage/homeNav/homeNav.dart';
import 'package:my_movie_app/view/searchPage/searchPage.dart';
import 'package:my_movie_app/view/setting/profile_page.dart';


class HomeController extends GetxController{

  final FavouriteController favouriteController = Get.put(FavouriteController());

// Biến để theo dõi tab hiện tại
  var selectedIndex = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  // Screens list to navigate
  // Danh sách các trang của bạn
  final List<Widget> pages = [
    HomeNavPage(),
    Categorypage(),
    Searchpage(),
    FavouritePage(),
   ProfilePage(),
  ];
  final List<String> titleString = [
    'History Movie',
    "Category",
    "Search",
    "Favourite",
    "Profile",
  ];

  // Hàm để chuyển tab
  void changeTab(int index) {
    selectedIndex.value = index;
    // Kiểm tra nếu tab "Favorites" được chọn
    if (index == 3) {
      favouriteController.loadFavorites(); // Làm mới danh sách yêu thích
    }
  }





}
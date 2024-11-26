import 'package:get/get.dart';
import 'package:my_movie_app/view/favourite/favouriteController.dart';

class FavouriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavouriteController());
  }
}
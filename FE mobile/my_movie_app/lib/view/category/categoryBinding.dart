import 'package:get/get.dart';
import 'package:my_movie_app/view/category/categoryController.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
  }
}
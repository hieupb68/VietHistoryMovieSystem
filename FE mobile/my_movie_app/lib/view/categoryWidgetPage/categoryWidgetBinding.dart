import 'package:get/get.dart';
import 'package:my_movie_app/view/categoryWidgetPage/categoryWidgetController.dart';

class CategoryWidgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryWidgetController());
  }
}
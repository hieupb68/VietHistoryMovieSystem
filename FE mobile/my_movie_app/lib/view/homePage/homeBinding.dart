import 'package:get/get.dart';
import 'package:my_movie_app/view/homePage/homeController.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

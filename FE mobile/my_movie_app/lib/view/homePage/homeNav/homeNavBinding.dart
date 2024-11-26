import 'package:get/get.dart';
import 'package:my_movie_app/view/homePage/homeNav/homeNavController.dart';


class HomeNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeNavController());
  }
}

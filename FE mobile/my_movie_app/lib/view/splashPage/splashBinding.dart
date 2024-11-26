import 'package:get/get.dart';
import 'package:my_movie_app/view/splashPage/splashController.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
  
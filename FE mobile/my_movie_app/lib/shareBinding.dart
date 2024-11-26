import 'package:get/get.dart';
import 'package:my_movie_app/shareController.dart';


class ShareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareController());
  }
}

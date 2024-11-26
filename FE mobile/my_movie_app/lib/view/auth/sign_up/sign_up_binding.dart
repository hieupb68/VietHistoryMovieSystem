import 'package:get/get.dart';
import 'package:my_movie_app/view/auth/sign_up/sign_up_controller.dart';


class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
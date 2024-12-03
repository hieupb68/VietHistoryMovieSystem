import 'package:get/get.dart';
import 'package:my_movie_app/appRouter.dart';
import 'package:my_movie_app/core/service/api_service.dart';
import 'package:my_movie_app/core/utils/common_dialog.dart';
import 'package:my_movie_app/models/feedback.dart';
import 'package:my_movie_app/shareController.dart';

class LoginController extends GetxController {
  final ShareController shareController = Get.put(ShareController());
  Future<void> login(String userName, String password) async {
    // Validate input fields
    if (userName.isEmpty) {
      CommonDialog.showErrorDialog(
        'Validation Error',
        'Please enter your username.',
      );
      return;
    }

    if (password.isEmpty) {
      CommonDialog.showErrorDialog(
        'Validation Error',
        'Please enter your password.',
      );
      return;
    }
    // Call API or handle login logic here
    try {
      // Simulate API call or login process
      bool isLoginSuccessful = await loginApi(userName, password);

      if (isLoginSuccessful) {
        // Navigate to home screen or do something

        Get.offAllNamed(AppRouter.HOME_PAGE); // Replace '/home' with your route
      } else {
        CommonDialog.showErrorDialog(
          'Login Failed',
          'Invalid username or password. Please try again.',
        );
      }
    } catch (error) {
      // Handle unexpected errors
      CommonDialog.showErrorDialog(
        'Error',
        'Something went wrong. Please try again later.',
      );
    }
  }
  Future<bool> loginApi(String userName, String password) async {
    User? user = await ApiService.login(userName, password);
    if(user == null){
      return false;
    }
    else{
      shareController.saveLogin(user);
      return true;
    }

  }

  // Simulated login API for demonstration
  Future<bool> _mockLoginApi(String userName, String password) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    // Mock success if username and password are "admin"
    return userName == 'admin' && password == 'admin123';
  }
}

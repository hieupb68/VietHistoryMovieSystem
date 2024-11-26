import 'package:get/get.dart';
import 'package:my_movie_app/core/service/api_service.dart';
import 'package:my_movie_app/core/utils/common_dialog.dart';

class SignUpController extends GetxController {
  Future<void> signUp(String email, String userName, String password, String confirmPassword) async {
    // Validate email
    // if (email.isEmpty) {
    //   CommonDialog.showErrorDialog(
    //     'Validation Error',
    //     'Please enter your email.',
    //   );
    //   return;
    // }

    // if (!GetUtils.isEmail(email)) {
    //   CommonDialog.showErrorDialog(
    //     'Validation Error',
    //     'Please enter a valid email address.',
    //   );
    //   return;
    // }

    // Validate username
    if (userName.isEmpty) {
      CommonDialog.showErrorDialog(
        'Validation Error',
        'Please enter your username.',
      );
      return;
    }

    if (userName.length < 3) {
      CommonDialog.showErrorDialog(
        'Validation Error',
        'Username must be at least 3 characters long.',
      );
      return;
    }

    // Validate password
    if (password.isEmpty) {
      CommonDialog.showErrorDialog(
        'Validation Error',
        'Please enter your password.',
      );
      return;
    }

    if (password.length < 6) {
      CommonDialog.showErrorDialog(
        'Validation Error',
        'Password must be at least 6 characters long.',
      );
      return;
    }

    // Validate confirm password
    if (confirmPassword.isEmpty) {
      CommonDialog.showErrorDialog(
        'Validation Error',
        'Please confirm your password.',
      );
      return;
    }

    if (password != confirmPassword) {
      CommonDialog.showErrorDialog(
        'Validation Error',
        'Passwords do not match.',
      );
      return;
    }

    // Call API or handle sign-up logic here
    try {
      // Simulate API call
      bool isSignUpSuccessful = await _mockSignUpApi(email, userName, password);

      if (isSignUpSuccessful) {
        // Navigate to another screen or show success message
        Get.offAllNamed('/welcome'); // Replace '/welcome' with your route
      } else {
        CommonDialog.showErrorDialog(
          'Sign Up Failed',
          'Something went wrong. Please try again later.',
        );
      }
    } catch (error) {
      // Handle unexpected errors
      CommonDialog.showErrorDialog(
        'Error',
        'An unexpected error occurred. Please try again later.',
      );
    }
  }

  // Simulated sign-up API for demonstration
  Future<bool> _mockSignUpApi(String email, String userName, String password) async {
    // await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    // // Mock success if username and email are "unique"
    // return email != 'existing@example.com' && userName != 'existingUser';
    return await ApiService.register(userName, password);
  }
}

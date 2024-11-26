import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie_app/appRouter.dart';
import 'package:my_movie_app/comon/widget/textfield_custom.dart';
import 'package:my_movie_app/view/auth/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 100),
               Text(
                'welcome_back'.tr,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
               Text(
                'login_prompt'.tr,
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Text('user_name'.tr),
              const SizedBox(height: 4),
              CustomTextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              Text('password'.tr),
              const SizedBox(height: 4),
              CustomTextField(
                controller: passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Xử lý khi nhấn "Quên mật khẩu"
                  },
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Xử lý khi nhấn nút đăng nhập
                  String email = emailController.text;
                  String password = passwordController.text;
                  loginController.login(email, password);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child:  Text(
                  'login'.tr,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('dont_have_account'.tr),
                  TextButton(
                    onPressed: () {
                      // Xử lý khi nhấn "Đăng ký"
                      Get.offAndToNamed(AppRouter.SIGN_UP);
                    },
                    child:  Text('sign_up'.tr),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

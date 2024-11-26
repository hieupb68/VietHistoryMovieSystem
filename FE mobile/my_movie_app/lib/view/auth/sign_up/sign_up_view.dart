import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie_app/appRouter.dart';
import 'package:my_movie_app/comon/widget/textfield_custom.dart';
import 'package:my_movie_app/view/auth/sign_up/sign_up_controller.dart';

class SignUpView extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final SignUpController signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80),
               Text(
                'create_account'.tr,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
               Text(
                'register_details'.tr,
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Text('user_name'.tr),
              const SizedBox(height: 4),
              CustomTextField(
                controller: usernameController,
                keyboardType: TextInputType.text,
              ),
              // const SizedBox(height: 16),
              // Text('Email'),
              // const SizedBox(height: 4),
              // CustomTextField(
              //   controller: emailController,
              //   keyboardType: TextInputType.emailAddress,
              // ),
              const SizedBox(height: 16),
              Text('password'.tr),
              const SizedBox(height: 4),
              CustomTextField(
                controller: passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              Text('confirm_password'.tr),
              const SizedBox(height: 4),
              CustomTextField(
                controller: confirmPasswordController,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String email = emailController.text;
                  String password = passwordController.text;
                  String username = usernameController.text;
                  String rePassword = confirmPasswordController.text;
                  signUpController.signUp(email,username, password,rePassword);

                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child:  Text(
                  'sign_up'.tr,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('already_have_account'.tr),
                  TextButton(
                    onPressed: () {
                      // Xử lý khi nhấn "Đăng nhập"
                      // Navigator.pop(context);
                      Get.offAndToNamed(AppRouter.LOGIN);
                    },
                    child:  Text('login'.tr),
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

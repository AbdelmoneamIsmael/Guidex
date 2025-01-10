import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool passowrdVisible = true;
  bool confirmPasswordVisible = true;

@override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  changePasswordVisibility() {
    passowrdVisible = !passowrdVisible;
    update();
  }
  changeConfirmPasswordVisibility() {
    confirmPasswordVisible = !confirmPasswordVisible;
    update();
  }
}

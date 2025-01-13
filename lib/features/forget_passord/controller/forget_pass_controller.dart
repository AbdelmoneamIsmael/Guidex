import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/features/forget_passord/presentation/view/enter_code.dart';
import 'package:guidix/features/forget_passord/presentation/view/enter_email.dart';
import 'package:guidix/features/forget_passord/presentation/view/enter_new_password.dart';

class ForgetPassController extends GetxController {
  RxInt currentStep = 0.obs;
  List<String> currentTitle = [
    'Forget Password',
    'Verify Your Email',
    'Create New Password',
  ];
  List<Widget> currentPage = [
    const EnterEmail(),
    const EnterCode(),
    const EnterNewPassword(),
  ];
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  bool isPasswordSecure = true;
  bool isRePasswordSecure = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    currentStep.close();
    super.dispose();
  }

  nextStep() {
    if (currentStep.value < currentPage.length - 1) {
      currentStep.value++;
    } else {
      Get.offAndToNamed(
        Routes.loginScreen,
      );
    }
  }

  backStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    } else {
      Get.back();
    }
  }

  changePasswordSecure() {
    isPasswordSecure = !isPasswordSecure;
    update();
  }

  changeRePasswordSecure() {
    isRePasswordSecure = !isRePasswordSecure;
    update();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  nextStep() => currentStep.value++;
  backStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    } else {
      Get.back();
    }
  } 
}

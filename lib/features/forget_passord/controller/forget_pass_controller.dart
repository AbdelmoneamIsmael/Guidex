import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/widgets/ui_helper.dart';
import 'package:guidix/features/confirm_otp/domain/repositories/confirm_otp_repo.dart';
import 'package:guidix/features/forget_passord/data/repo/forget_password_repo.dart';
import 'package:guidix/features/forget_passord/presentation/view/enter_code.dart';
import 'package:guidix/features/forget_passord/presentation/view/enter_email.dart';
import 'package:guidix/features/forget_passord/presentation/view/enter_new_password.dart';

class ForgetPassController extends GetxController {
  ForgetPassController({
    required this.confirmOtpRepo,
    required this.forgetPasswordRepo,
  });
  final ForgetPasswordRepo forgetPasswordRepo;
  final ConfirmOtpRepo confirmOtpRepo;
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

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
  TextEditingController otpController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  RxBool isPasswordSecure = true.obs;
  RxBool isRePasswordSecure = true.obs;
  @override
  void dispose() {
    emailController.dispose();
    otpController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    currentStep.close();
    super.dispose();
  }

  nextStep() {
    if (currentStep.value < currentPage.length - 1) {
      currentStep.value++;
    } else {
      Get.offAllNamed(
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
    isPasswordSecure.value = !isPasswordSecure.value;
  }

  changeRePasswordSecure() {
    isRePasswordSecure.value = !isRePasswordSecure.value;
  }

  confirmEmail() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        final result =
            await forgetPasswordRepo.confirmEmail(email: emailController.text);
        result.fold((l) {
          isLoading.value = false;

          UIHelper.showSnackbar(context: Get.context!, message: l.message);
        }, (r) {
          UIHelper.showSnackbar(context: Get.context!, message: r.message!);
          isLoading.value = false;

          nextStep();
        });
      } on Exception catch (e) {
        isLoading.value = false;

        UIHelper.showSnackbar(context: Get.context!, message: e.toString());
      }
    }
  }

  resendOtp() async {
    try {
      isLoading.value = true;

      var result = await confirmOtpRepo.sendOtp(email: emailController.text);
      result.fold((l) {
        isLoading.value = false;

        UIHelper.showSnackbar(context: Get.context!, message: l.message);
      }, (r) {
        isLoading.value = false;

        UIHelper.showSnackbar(context: Get.context!, message: r.message!);
      });
    } on Exception catch (e) {
      isLoading.value = false;

      UIHelper.showSnackbar(context: Get.context!, message: e.toString());
    }
  }

  changePassword() async {
    if (formKey3.currentState!.validate() &&
        passwordController.text == rePasswordController.text) {
      isLoading.value = true;

      try {
        final result = await forgetPasswordRepo.changePassword(
          data: {
            "email": emailController.text,
            "otp": otpController.text,
            "newPassword": rePasswordController.text
          },
        );
        result.fold((l) {
          isLoading.value = false;

          UIHelper.showSnackbar(context: Get.context!, message: l.message);
        }, (r) {
          isLoading.value = false;

          UIHelper.showSnackbar(context: Get.context!, message: r.message!);
          nextStep();
        });
      } on Exception catch (e) {
        isLoading.value = false;

        UIHelper.showSnackbar(context: Get.context!, message: e.toString());
      }
    }
  }

  void confirmOtp() {
    if (formKey2.currentState!.validate()) {
      nextStep();
    }
  }
}

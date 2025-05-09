import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/widgets/ui_helper.dart';
import 'package:guidix/features/register/domain/entity/register_user_params.dart';
import 'package:guidix/features/register/domain/repo/register_user_repo.dart';

class RegisterController extends GetxController {
  RegisterController({required this.registerUserRepo});
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool passowrdVisible = true;
  bool confirmPasswordVisible = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RegisterUserRepo registerUserRepo;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
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

  Future<void> signUp() async {
    if (formKey.currentState!.validate() &&
        passwordController.text == confirmPasswordController.text) {
      isLoading = true;
      update();
      try {
        var result = await registerUserRepo.registerUser(
          regesterUserParams: RegesterUserParams(
            phone: phoneController.text,
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
          ),
        );
        result.fold((l) {
          UIHelper.showSnackbar(context: Get.context!, message: l.message);
          isLoading = false;
          update();
        }, (r) {
          isLoading = false;
          update();
          if (r.success == true) {
            UIHelper.showSnackbar(context: Get.context!, message: r.message!);
            return Get.offAllNamed(Routes.loginScreen);
          } else {
            UIHelper.showSnackbar(context: Get.context!, message: r.message!);
          }
        });
      } on Exception catch (e) {
        UIHelper.showSnackbar(context: Get.context!, message: e.toString());
      }
    }
  }
}

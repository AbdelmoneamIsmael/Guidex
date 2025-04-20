import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/const/enum.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/widgets/ui_helper.dart';
import 'package:guidix/features/login/data/model/login_prameters.dart';
import 'package:guidix/features/login/repo/login_repo.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordSecure = true;
  final LoginRepo loginRepo;
  bool isLoading = false;

  LoginController({required this.loginRepo});
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void changePasswordSecure() {
    passwordSecure = !passwordSecure;
    update();
  }

  void login({
    required BuildContext context,
  }) async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading = true;
        var result = await loginRepo.login(
          params: LoginPrameters(
            email: emailController.text,
            password: passwordController.text,
            fcmToken: "",
          ),
        );
        result.fold((l) {
          isLoading = false;
          UIHelper.showSnackbar(
              message: l.message,
              context: context,
              title: AppLocalizations.of(context).wrongHappened);
        }, (r) {
          isLoading = false;
          UIHelper.showToast(
            AppLocalizations.of(context).loginSuccess,
            SnackBarType.success,
          );
          Get.offAllNamed(Routes.mainGuidixScreen);
        });
      } on Exception catch (e) {
        isLoading = false;
        UIHelper.showToast(
          "${AppLocalizations.of(context).wrongHappened} $e",
          SnackBarType.error,
        );
      }
    }
  }
}

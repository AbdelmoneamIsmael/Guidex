import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_controller/app_controller.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/const/enum.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/widgets/ui_helper.dart';
import 'package:guidix/features/login/data/model/sign_in_model.dart';
import 'package:guidix/features/login/data/repo/signin_repo.dart';
import 'package:guidix/features/login/repo/login_repo.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordSecure = true;
  
  bool isLoading = false;

  LoginController();
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

  Future<void> login({
    required SigninRepo signinRepo,
    required GetUserInfoRepo getUserInfo,
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      var result = await signinRepo.login();
      result.fold(
        (l) {
          isLoading = false;
          UIHelper.showSnackbar(context: context, message: l.message);
          update();
        },
        (r) async {
          print(r);
          var userInfo = await getUserInfo.getUserInfo();
          userInfo.fold(
            (l) => UIHelper.showSnackbar(context: context, message: l.message),
            (info) {
              Get.find<AppController>().cacheUSer(userInfo: info, user: r);
              isLoading = false;
              update();
              Get.offAllNamed(Routes.homeScreen);
            },
          );
        },
      );
    } on Exception catch (e) {
      isLoading = false;
      if (context.mounted) {
        UIHelper.showSnackbar(context: context, message: e.toString());
        update();
      }
    }
  }
}

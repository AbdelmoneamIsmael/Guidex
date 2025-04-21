import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_controller/app_controller.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/global_pages/somthing_went_wrong.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/utils/cache_helper.dart';
import 'package:guidix/core/widgets/ui_helper.dart';
import 'package:guidix/features/confirm_otp/domain/repositories/confirm_otp_repo.dart';
import 'package:guidix/features/login/repo/login_repo.dart';

class ConfirmOtpController extends GetxController {
  ConfirmOtpController({
    required this.email,
    required this.confirmOtpRepo,
    required this.getUserInfo,
  });
  final String email;
  TextEditingController codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final ConfirmOtpRepo confirmOtpRepo;
  final GetUserInfoRepo getUserInfo;
  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    getCode();
  }

  getCode() async {
    isLoading = true;
    update();
    var result = await confirmOtpRepo.sendOtp(email: email);
    result.fold((l) {
      isLoading = false;

      update();
      UIHelper.showSnackbar(context: Get.context!, message: l.message);
      Get.to(const SomthingWentWrongScreen());
    }, (r) {
      isLoading = false;
      update();
      UIHelper.showSnackbar(context: Get.context!, message: r.message!);
    });
  }

  onVerify() {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      confirmOtpRepo
          .verifyOtp(email: email, otp: codeController.text)
          .then((value) => value.fold((l) {
                isLoading = false;
                update();
                UIHelper.showSnackbar(
                    context: Get.context!, message: l.message);
              }, (r) async {
                await CacheHelper.setSecuerString(
                    key: GetStoreageKey.accessToken, value: r.token!);
                await CacheHelper.setSecuerString(
                    key: GetStoreageKey.refreshToken, value: r.refreshToken!);
                var userInfo = await getUserInfo.getUserInfo();
                userInfo.fold(
                  (l) {
                    UIHelper.showSnackbar(
                        context: Get.context!, message: l.message);
                  },
                  (info) async {
                    await Get.find<AppController>()
                        .cacheUSer(userInfo: info, user: r);
                    isLoading = false;
                    update();
                    Get.offAllNamed(Routes.mainGuidixScreen);
                  },
                );
              }))
          .catchError((e) {
        isLoading = false;
        update();
        UIHelper.showSnackbar(context: Get.context!, message: e);
      });
    }
  }
}

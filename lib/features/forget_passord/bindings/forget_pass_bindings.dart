import 'package:get/get.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/features/confirm_otp/domain/repositories/confirm_otp_repo.dart';
import 'package:guidix/features/forget_passord/controller/forget_pass_controller.dart';
import 'package:guidix/features/forget_passord/data/repo/forget_password_repo.dart';

class ForgetPassBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPassController(
        confirmOtpRepo:  getIt.get<ConfirmOtpRepo>(),
          forgetPasswordRepo: getIt.get<ForgetPasswordRepo>(),
        ));
  }
}

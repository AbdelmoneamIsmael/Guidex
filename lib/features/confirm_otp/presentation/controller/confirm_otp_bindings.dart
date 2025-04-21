import 'package:get/get.dart';
import 'package:guidix/core/utils/functions/initialize_getit/initialize_getit.dart';
import 'package:guidix/features/confirm_otp/domain/repositories/confirm_otp_repo.dart';
import 'package:guidix/features/confirm_otp/presentation/controller/confirm_otp_controller.dart';
import 'package:guidix/features/login/repo/login_repo.dart';

class ConfirmOtpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmOtpController(
          getUserInfo: getIt.get<GetUserInfoRepo>(),
          email: Get.arguments["email"],
          confirmOtpRepo:  getIt.get<ConfirmOtpRepo>(),
        ));
  }
}

import 'package:get/get.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/features/register/domain/repo/register_user_repo.dart';
import 'package:guidix/features/register/presentation/controller/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(
      registerUserRepo: getIt.get<RegisterUserRepo>(),
    ));
  }
}
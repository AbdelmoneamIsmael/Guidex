import 'package:get/get.dart';
import 'package:guidix/features/login/data/remote_login/remote_login.dart';
import 'package:guidix/features/login/data/repo/login_repo_imple.dart';
import 'package:guidix/features/login/presentation/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(
          loginRepo: LoginRepoImple(remoteLogin: RemoteLogin()),
        ));
  }
}

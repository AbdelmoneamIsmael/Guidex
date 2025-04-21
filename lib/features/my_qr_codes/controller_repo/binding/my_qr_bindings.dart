import 'package:get/get.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/controller/my_qr_controller.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/category_repo.dart';

class MyQrBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyQrController(
          categoryRepo: getIt.get<CategoryRepo>(),
        ));
  }
}

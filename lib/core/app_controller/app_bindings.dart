import 'package:get/get.dart';
import 'package:guidix/core/app_controller/app_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AppController(),
      fenix: true,
    );
  }
}

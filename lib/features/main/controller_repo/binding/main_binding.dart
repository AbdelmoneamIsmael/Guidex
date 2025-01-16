import 'package:get/get.dart';
import 'package:guidix/features/main/controller_repo/controller/main_controller.dart';

class MainBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}
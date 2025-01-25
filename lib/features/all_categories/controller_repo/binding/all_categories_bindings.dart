import 'package:get/get.dart';
import 'package:guidix/features/all_categories/controller_repo/controller/all_categories_controller.dart';

class AllCategoriesBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AllCategoriesController());
  }
}

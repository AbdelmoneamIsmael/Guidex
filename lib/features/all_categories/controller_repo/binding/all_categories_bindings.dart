import 'package:get/get.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/features/all_categories/controller_repo/controller/all_categories_controller.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/category_repo.dart';

class AllCategoriesBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      AllCategoriesController(
        categoryRepo: getIt.get<CategoryRepo>(),
      ),
    );
  }
}

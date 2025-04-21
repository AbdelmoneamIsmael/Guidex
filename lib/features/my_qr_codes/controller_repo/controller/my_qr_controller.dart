import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:guidix/core/widgets/ui_helper.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/category_repo.dart';
import 'package:guidix/features/my_qr_codes/data/model/category_model.dart';

class MyQrController extends GetxController {
  MyQrController({
    required this.categoryRepo,
  });
  final CategoryRepo categoryRepo;
  bool isLoading = false;
  List<CategoryModel> categories = [];
  CategoryModel selectedCategory = CategoryModel.empty();

  void getAllCategories({
    required BuildContext context,
  }) async {
    isLoading = true;
    update();
    try {
      var result = await categoryRepo.getCategories(
        isPagenation: true,
        pageIndex: 1,
        pageSize: 10,
      );
      result.fold((l) {
        isLoading = false;
        update();
        UIHelper.showSnackbar(context: context, message: l.message);
      }, (r) {
        isLoading = false;
        update();
        categories = r.data;
      });
    } catch (e) {
      isLoading = false;
      update();
    }
  }

  getAllqrCodes() {
    update();
  }
}

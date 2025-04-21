import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/widgets/ui_helper.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/category_repo.dart';
import 'package:guidix/features/my_qr_codes/data/model/category_model.dart';

class AllCategoriesController extends GetxController {
  final CategoryRepo categoryRepo;
  bool isLoading = false;
  List<CategoryModel> categories = [];
  CategoryModel? selectedCategory;
  TextEditingController arabicNameController = TextEditingController();
  TextEditingController englishNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AllCategoriesController({required this.categoryRepo});
  @override
  void onInit() {
    getAllCategories(context: Get.context!);
    super.onInit();
  }

  @override
  void dispose() {
    arabicNameController.dispose();
    englishNameController.dispose();
    super.dispose();
  }

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

  void deleteCategory(
      {required BuildContext context, required CategoryModel category}) {
    isLoading = true;
    update();
    categoryRepo.deleteCategory(id: category.id!).then((value) {
      value.fold((l) {
        isLoading = false;
        update();
        UIHelper.showSnackbar(context: context, message: l.message);
      }, (r) {
        isLoading = false;
        update();
        UIHelper.showSnackbar(context: context, message: r.message!);
        getAllCategories(context: context);
      });
    });
  }

  void addCategory({required BuildContext context}) {
    if (arabicNameController.text.isNotEmpty ||
        englishNameController.text.isNotEmpty) {
      isLoading = true;
      update();
      if (arabicNameController.text.isEmpty) {
        arabicNameController.text = englishNameController.text;
      }
      if (englishNameController.text.isEmpty) {
        englishNameController.text = arabicNameController.text;
      }
      categoryRepo
          .addCategory(
        arName: arabicNameController.text,
        enName: englishNameController.text,
      )
          .then((value) {
        value.fold((l) {
          isLoading = false;
          update();
          UIHelper.showSnackbar(context: context, message: l.message);
        }, (r) {
          Get.back();
          isLoading = false;
          update();
          UIHelper.showSnackbar(context: context, message: r.message!);
          categories.clear();
          getAllCategories(context: context);
        });
      });
    } else {
      UIHelper.showSnackbar(
          context: context,
          message: AppLocalizations.of(context).atLeastOneRequered);
    }
  }
}

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/widgets/ui_helper.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/category_repo.dart';
import 'package:guidix/features/my_qr_codes/data/model/category_model.dart';

class AllCategoriesController extends GetxController {
  final CategoryRepo categoryRepo;

  List<CategoryModel> categories = [];
  CategoryModel? selectedCategory;
  TextEditingController arabicNameController = TextEditingController();
  TextEditingController englishNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AllCategoriesController({required this.categoryRepo});
  bool isThereMoreItems = true;
  bool isLoading = false;
  bool isInitialLoading = false;
  int pageIndex = 1;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    selectedCategory = Get.arguments["category"];
    getAllCategories();
    scrollController.addListener(_onScroll);
    super.onInit();
  }

  void _onScroll() {
    if (scrollController.hasClients) {
      double currentPosition = scrollController.position.pixels;
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      double seventyPercentOffset = maxScrollExtent * 0.7;
      if (currentPosition >= seventyPercentOffset &&
          isThereMoreItems &&
          isLoading == false &&
          isInitialLoading == false) {
        getAllCategories();
      }
    }
  }

  @override
  void dispose() {
    arabicNameController.dispose();
    englishNameController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void getAllCategories() async {
    isLoading = true;
    if (categories.isEmpty) {
      isInitialLoading = true;
    }
    update();
    try {
      var result = await categoryRepo.getCategories(
        isPagenation: true,
        pageIndex: 1,
        pageSize: 10,
      );
      result.fold((l) {
        isLoading = false;
        isInitialLoading = false;
        update();
        UIHelper.showSnackbar(context: Get.context!, message: l.message);
      }, (r) {
        isLoading = false;
        isInitialLoading = false;
        update();
        categories.addAll(r.data);
        isThereMoreItems = r.hasNextPage!;
        pageIndex++;
      });
    } catch (e) {
      isLoading = false;
      isInitialLoading = false;
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
        categories.clear();
        getAllCategories();
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

          arabicNameController.clear();
          englishNameController.clear();
        });
      });
    } else {
      UIHelper.showSnackbar(
          context: context,
          message: AppLocalizations.of(context).atLeastOneRequered);
    }
  }

  void prepareCategoryForUpdate({required CategoryModel category}) {
    arabicNameController.text = category.nameAr!;
    englishNameController.text = category.nameEn!;
  }

  void updateCategory(
      {required BuildContext context, required CategoryModel category}) {
    if (arabicNameController.text.isNotEmpty ||
        englishNameController.text.isNotEmpty) {
      if (arabicNameController.text.isEmpty) {
        arabicNameController.text = englishNameController.text;
      }
      if (englishNameController.text.isEmpty) {
        englishNameController.text = arabicNameController.text;
      }
      category.nameAr = arabicNameController.text;
      category.nameEn = englishNameController.text;
      isLoading = true;
      update();
      categoryRepo.updateCategory(category: category).then((value) {
        value.fold((l) {
          isLoading = false;
          update();
          UIHelper.showSnackbar(context: context, message: l.message);
        }, (r) {
          Get.back();
          isLoading = false;
          update();
          UIHelper.showSnackbar(context: context, message: r.message!);
        });
      });
    } else {
      UIHelper.showSnackbar(
          context: context,
          message: AppLocalizations.of(context).atLeastOneRequered);
    }
  }

  void pickCategory({required CategoryModel category}) {
    selectedCategory?.id = category.id;
    selectedCategory?.nameAr = category.nameAr;
    selectedCategory?.nameEn = category.nameEn;
    update();
    Get.back();
  }
}

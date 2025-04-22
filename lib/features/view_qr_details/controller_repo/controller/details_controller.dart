import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_controller/app_controller.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/widgets/ui_helper.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/qrcode_repo.dart';
import 'package:guidix/features/my_qr_codes/data/model/category_model.dart';
import 'package:guidix/features/my_qr_codes/data/model/qrcode_model.dart';

class QrCodeDetailsController extends GetxController {
  QrCodeDetailsController(
      {required this.qrCodeModel, required this.qrcodeRepo});
  QrcodeModel qrCodeModel;
  TextEditingController nameArController = TextEditingController();
  TextEditingController describtionArController = TextEditingController();
  TextEditingController nameEnController = TextEditingController();
  TextEditingController describtionEnController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  final QrcodeRepo qrcodeRepo;
  bool isLoading = false;

  @override
  void onInit() {
    nameArController.text = qrCodeModel.nameAr ?? "";
    describtionArController.text = qrCodeModel.descriptionAr ?? "";
    nameEnController.text = qrCodeModel.nameEn ?? "";
    describtionEnController.text = qrCodeModel.descriptionEn ?? "";
    categoryController.text = "";
    super.onInit();
  }

  @override
  void dispose() {
    nameArController.dispose();
    describtionArController.dispose();
    nameEnController.dispose();
    describtionEnController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  void applyChanges() async {
    isLoading = true;
    update();
    if (((nameArController.text.isNotEmpty &&
                describtionArController.text.isNotEmpty) ||
            (nameEnController.text.isNotEmpty &&
                describtionEnController.text.isNotEmpty)) &&
        qrCodeModel.categoryId != null) {
      fillREmaining();
      print(qrCodeModel.toJson());
      qrCodeModel.nameAr = nameArController.text;
      qrCodeModel.descriptionAr = describtionArController.text;
      qrCodeModel.nameEn = nameEnController.text;
      qrCodeModel.descriptionEn = describtionEnController.text;
      try {
        var result = await qrcodeRepo.updateQrCode(qrcode: qrCodeModel);
        result.fold((l) {
          isLoading = false;
          update();
          UIHelper.showSnackbar(context: Get.context!, message: l.message);
        }, (r) {
          isLoading = false;
          update();

          Get.back();
        });
      } on Exception catch (e) {
        isLoading = false;
        update();
        UIHelper.showSnackbar(context: Get.context!, message: e.toString());
      }
    } else {
      isLoading = false;
      update();
      UIHelper.showSnackbar(
          context: Get.context!,
          message: AppLocalizations.of(Get.context!).pleaseSelectCategory);
    }
  }

  void fillREmaining() {
    if (nameArController.text.isEmpty) {
      nameArController.text = nameEnController.text;
    }
    if (describtionArController.text.isEmpty) {
      describtionArController.text = describtionEnController.text;
    }
    if (nameEnController.text.isEmpty) {
      nameEnController.text = nameArController.text;
    }
    if (describtionEnController.text.isEmpty) {
      describtionEnController.text = describtionArController.text;
    }
  }

  void selectCategory() {
    CategoryModel categoryModel = CategoryModel.empty();
    Get.toNamed(
      Routes.allCategories,
      arguments: {"category": categoryModel},
    )?.then((value) {
      if (categoryModel.id != -1) {
        qrCodeModel.categoryId = categoryModel.id;
        qrCodeModel.categoryNameAr = categoryModel.nameAr;
        qrCodeModel.categoryNameEn = categoryModel.nameEn;
        update();
      }
    });
  }
}

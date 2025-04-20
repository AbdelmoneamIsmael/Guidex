import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_controller/app_controller.dart';
import 'package:guidix/core/models/qrcode_generation.dart';

class QrCodeDetailsController extends GetxController {
  QrCodeDetailsController({
    required this.qrCodeModel,
  });
  QrCodeGeenerationModel qrCodeModel;
  TextEditingController nameArController = TextEditingController();
  TextEditingController describtionArController = TextEditingController();
  TextEditingController nameEnController = TextEditingController();
  TextEditingController describtionEnController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  void onInit() {
    nameArController.text = qrCodeModel.nameAr ?? "";
    describtionArController.text = qrCodeModel.descriptionAr ?? "";
    nameEnController.text = qrCodeModel.nameEn ?? "";
    describtionEnController.text = qrCodeModel.describtonEn ?? "";
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

  void applyChanges() {
    qrCodeModel.nameAr = nameArController.text;
    qrCodeModel.descriptionAr = describtionArController.text;
    qrCodeModel.nameEn = nameEnController.text;
    qrCodeModel.describtonEn = describtionEnController.text;
    print(
      Get.find<AppController>()
          .qrCodeList
          .where(
            (element) {
              print(element.qrCodeId == qrCodeModel.qrCodeId);
              return element.qrCodeId == qrCodeModel.qrCodeId;
            },
          )
          .toList()
          .isEmpty,
    );
    if (Get.find<AppController>()
        .qrCodeList
        .where((element) => element.qrCodeId == qrCodeModel.qrCodeId)
        .isEmpty) {
      Get.find<AppController>().qrCodeList.add(qrCodeModel);
      Get.find<AppController>()
          .ids
          .where((element) => element["id"] == qrCodeModel.qrCodeId)
          .first["value"] = true;
    }
    printInfo(info: Get.find<AppController>().qrCodeList.toString());
    Get.back();
  }
}

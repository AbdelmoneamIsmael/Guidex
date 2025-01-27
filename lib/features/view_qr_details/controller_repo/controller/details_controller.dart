import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/models/qr_code_model.dart';

class QrCodeDetailsController extends GetxController {
  QrCodeDetailsController({
    required this.qrCodeModel,
  });
  QrModel qrCodeModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController describtionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  void onInit() {
    nameController.text = qrCodeModel.title!;
    describtionController.text = qrCodeModel.describtion!;
    categoryController.text = qrCodeModel.category!.categoryName!;
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    describtionController.dispose();
    categoryController.dispose();
    super.dispose();
  }
}

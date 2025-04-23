import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_controller/app_controller.dart';
import 'package:guidix/core/helper/helper_mixin.dart';
import 'package:guidix/core/models/user/user_info.dart';
import 'package:guidix/features/edit_profile/domain/entity/person_edit_params.dart';

class EditProfileController extends GetxController with ImageHelperMixin {
  UserInfoModel? userInfoModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  File? image;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    userInfoModel = Get.find<AppController>().userInfoModel;
    nameController.text = userInfoModel!.name ?? "";
    emailController.text = userInfoModel!.email ?? "";
    phoneController.text = userInfoModel!.phoneNumber ?? "";
    super.onInit();
  }

  void pickImage() async {
    try {
      image = await pickGallaryImage();
      update();
    } on Exception catch (_) {
      // TODO
    }
    update();
  }

  updateProfileData() async {
    PersonEditModelParams personEditModelParams = PersonEditModelParams(
      name: nameController.text,
      email: emailController.text,
      phoneNumber: phoneController.text,
      image: image,
      password: null,
    );
  }
}

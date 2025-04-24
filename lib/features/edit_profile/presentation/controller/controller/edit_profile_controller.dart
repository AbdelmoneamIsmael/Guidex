import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_controller/app_controller.dart';
import 'package:guidix/core/helper/helper_mixin.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/core/models/user/user_info.dart';
import 'package:guidix/core/widgets/ui_helper.dart';
import 'package:guidix/features/edit_profile/domain/entity/person_edit_params.dart';
import 'package:guidix/features/edit_profile/domain/repo/update_profile_repo.dart';
import 'package:guidix/features/login/repo/login_repo.dart';

class EditProfileController extends GetxController with ImageHelperMixin {
  UserInfoModel? userInfoModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  File? image;
  final UpdateProfileRepo updateProfileRepo;
  final GetUserInfoRepo getUserInfoRepo;
  bool isLoading = false;

  EditProfileController(
      {required this.updateProfileRepo, required this.getUserInfoRepo});
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
    isLoading = true;
    update();
    try {
      var result = await updateProfileRepo.updateProfile(personEditModelParams);
      result.fold(
        (l) {
          isLoading = false;
          update();
          UIHelper.showSnackbar(context: Get.context!, message: l.message);
        },
        (r) async {
          await getUserInfo(r);
        },
      );
      update();
    } on Exception catch (e) {
      isLoading = false;
      update();
      UIHelper.showSnackbar(context: Get.context!, message: e.toString());
    }
  }

  Future<void> getUserInfo(BasicResponseModel userUpdateResponce) async {
    try {
      var getUserInfo = await getUserInfoRepo.getUserInfo();
      getUserInfo.fold((l) {
        isLoading = false;
        update();
        UIHelper.showSnackbar(context: Get.context!, message: l.message);
      }, (r) async {
        isLoading = false;
        update();
        userInfoModel = r;
        Get.find<AppController>().userInfoModel = r;
        await Get.find<AppController>().setUSerInfo(userInfo: r);
        UIHelper.showSnackbar(
            context: Get.context!, message: userUpdateResponce.message!);
      });
    } on Exception catch (e) {
      isLoading = false;
      update();
      UIHelper.showSnackbar(context: Get.context!, message: e.toString());
    }
  }
}

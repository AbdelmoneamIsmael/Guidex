import 'package:get/get.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/features/edit_profile/domain/repo/update_profile_repo.dart';
import 'package:guidix/features/edit_profile/presentation/controller/controller/edit_profile_controller.dart';
import 'package:guidix/features/login/repo/login_repo.dart';

class EditProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController(
       updateProfileRepo: getIt.get<UpdateProfileRepo>(),
       getUserInfoRepo:  getIt.get<GetUserInfoRepo>(),
    ));
  }
}
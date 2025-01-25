import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/gen/assets.gen.dart';

class ProfileController extends GetxController {
  List<String> profileList = [
    "Profile",
    "Orders",
    "Payments",
    "My Address",
    "Invite friends",
    "Help",
    "Setting",
  ];
  List<String> profileListIcon = [
    Assets.icons.userProfile,
    Assets.icons.order,
    Assets.icons.card,
    Assets.icons.marker,
    Assets.icons.inventFrinde,
    Assets.icons.help,
    Assets.icons.sitting2,
   
  ];

  void tapAction(int index) {
    switch (index) {
      case 6:
        Get.toNamed(Routes.settingScreen);
        break;
    }
  }

}

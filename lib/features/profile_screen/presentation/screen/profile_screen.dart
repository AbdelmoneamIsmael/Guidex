import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/features/profile_screen/controller_repo/controller/profile_controller.dart';
import 'package:guidix/features/profile_screen/presentation/widget/profile_option_widget.dart';
import 'package:guidix/gen/assets.gen.dart';
import 'package:share_plus/share_plus.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(context: context),
      builder: (controller) {
        return Scaffold(
          appBar: GuidixAppBar(title: AppLocalizations.of(context).myAccount),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16).w,
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 25.r,
                    backgroundImage:
                        AssetImage(Assets.images.profileImage.path),
                  ),
                  title: const Text(
                    "Hi, Abdelmoenam",
                  ),
                  titleTextStyle: AppTextStyle.medium16(context),
                  subtitle: const Text("Met you always be good"),
                  subtitleTextStyle: AppTextStyle.regular14(context),
                  contentPadding: EdgeInsets.zero,
                ),
                24.verticalSpace,
                Column(
                  spacing: 24.h,
                  children: [
                    ProfileOptionWidget(
                      title: AppLocalizations.of(context).profile,
                      icon: Assets.icons.userProfile,
                      onTap: () {
                        Get.toNamed(Routes.editProfile);
                      },
                    ),
                    ProfileOptionWidget(
                      title: AppLocalizations.of(context).orders,
                      icon: Assets.icons.order,
                      onTap: () {
                        Get.toNamed(Routes.ordersPage);
                      },
                    ),
                    // ProfileOptionWidget(
                    //   title: AppLocalizations.of(context).paymentMethod,
                    //   icon: Assets.icons.card,
                    //   onTap: () {
                    //     Get.toNamed(Routes.payments);
                    //   },
                    // ),
                    // ProfileOptionWidget(
                    //   title: AppLocalizations.of(context).myAddress,
                    //   icon: Assets.icons.marker,
                    //   onTap: () {
                    //     Get.toNamed(Routes.myAdress);
                    //   },
                    // ),
                    ProfileOptionWidget(
                      title: AppLocalizations.of(context).inviteFriends,
                      icon: Assets.icons.inventFrinde,
                      onTap: () async {
                        final result = await Share.share(
                            'check out my website https://example.com');

                        if (result.status == ShareResultStatus.success) {
                          print('Thank you for sharing my website!');
                        }
                      },
                    ),
                    ProfileOptionWidget(
                      title: AppLocalizations.of(context).help,
                      icon: Assets.icons.help,
                      onTap: () {
                        Get.toNamed(Routes.help);
                      },
                    ),
                    ProfileOptionWidget(
                        title: AppLocalizations.of(context).settings,
                        icon: Assets.icons.sitting2,
                        onTap: () {
                          Get.toNamed(Routes.settingScreen);
                        }),
                  ],
                ),
                30.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}

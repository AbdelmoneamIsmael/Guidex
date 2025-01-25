import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/features/profile_screen/controller_repo/controller/profile_controller.dart';
import 'package:guidix/features/profile_screen/presentation/widget/profile_option_widget.dart';
import 'package:guidix/gen/assets.gen.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuidixAppBar(title: AppLocalizations.of(context).myAccount),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16).w,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 25.r,
                backgroundImage: AssetImage(Assets.images.profileImage.path),
              ),
              title: const Text(
                "Hi, Abdelmoenam",
              ),
              titleTextStyle: AppTextStyle.medium16,
              subtitle: const Text("Met you always be good"),
              subtitleTextStyle: AppTextStyle.regular14,
              contentPadding: EdgeInsets.zero,
            ),
            24.verticalSpace,
            Column(
              spacing: 24,
              children: List.generate(
                controller.profileList.length,
                (index) => ProfileOptionWidget(
                  onTap: () {
                    controller.tapAction(index);
                  },
                  title: controller.profileList[index],
                  icon: controller.profileListIcon[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/widgets/app_textfield.dart';
import 'package:guidix/core/widgets/cashed_images.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/features/edit_profile/presentation/controller/controller/edit_profile_controller.dart';
import 'package:guidix/gen/assets.gen.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
        init: EditProfileController(),
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: Container(
              padding: const EdgeInsets.all(16),
              color: Theme.of(context).bottomAppBarTheme.color,
              child: PrimaryButton(
                title: AppLocalizations.of(context).done,
                onPressed: () {},
              ),
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 170.h,
                    child: Stack(
                      // fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          right: -125.w,
                          left: -146.w,
                          top: -400.h,
                          child: SvgPicture.asset(
                            width: 465.w,
                            height: 638.h,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).primaryColor,
                              BlendMode.srcIn,
                            ),
                            Assets.icons.profilePanner,
                          ),
                        ),
                        CupertinoButton(
                          onPressed: () => controller.pickImage(),
                          padding: const EdgeInsets.all(0),
                          minSize: 0,
                          child: Positioned(
                            right: 0,
                            left: 0,
                            bottom: -110.h,
                            child: Center(
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(200),
                                    ),
                                    child: controller.image == null
                                        ? CachedImage(
                                            width: 135.w,
                                            height: 135.w,
                                            fit: BoxFit.cover,
                                            url: controller
                                                .userInfoModel!.imageUrl!,
                                          )
                                        : Image.file(
                                            controller.image!,
                                            width: 135.w,
                                            height: 135.w,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                          backgroundColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          radius: 20.r,
                                          child: Icon(
                                            Icons.camera_alt_rounded,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .color,
                                          ))),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: GuidixAppBar(
                            title: AppLocalizations.of(context).profile,
                            forgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 164.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      spacing: 24.h,
                      children: [
                        AppTextField(
                          hintText: AppLocalizations.of(context).email,
                          controller: controller.emailController,
                          semanticLabel: "",
                          readOnly: true,
                          suffixIcon: SvgPicture.asset(
                            Assets.icons.edit,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        AppTextField(
                          hintText: AppLocalizations.of(context).fullName,
                          semanticLabel: "",
                          controller: controller.nameController,
                          suffixIcon: SvgPicture.asset(
                            Assets.icons.edit,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        AppTextField(
                          hintText: AppLocalizations.of(context).phoneNumber,
                          semanticLabel: "",
                          controller: controller.phoneController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          suffixIcon: SvgPicture.asset(
                            Assets.icons.edit,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            // body:
          );
        });
  }
}

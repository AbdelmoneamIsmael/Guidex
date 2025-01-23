import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/gen/assets.gen.dart';

class SecondOnboardScreen extends StatelessWidget {
  const SecondOnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            Assets.images.onBoarding2.path,
            fit: BoxFit.cover,
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).w,
              child: Column(
                children: [
                  48.verticalSpace,
                  SvgPicture.asset(
                    Assets.icons.appLogo,
                  ),
                  const Spacer(),
                  PrimaryButton(
                    title:  AppLocalizations.of(context).signUp,
                    hint: "Navigate to sign up Screen",
                    onPressed: () {
                      Get.toNamed(Routes.registerScreen);
                    },
                  ),
                  16.verticalSpace,
                  PrimaryButton(
                    title:  AppLocalizations.of(context).signIn,
                    hint: "Navigate to sign in Screen",
                    backgroundColor: Colors.transparent,
                    forGroundColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      Get.toNamed(Routes.loginScreen);
                    },
                  ),
                  60.verticalSpace,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

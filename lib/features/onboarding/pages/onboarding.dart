import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/gen/assets.gen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  Assets.images.onboarding.path,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    Assets.icons.appLogo,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 19).w,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Column(
                children: [
                  15.verticalSpace,
                  Text(
                    AppLocalizations.of(context).welcomeMessage,
                    style: AppTextStyle.regular16(context),
                    textAlign: TextAlign.center,
                  ),
                  32.verticalSpace,
                  PrimaryButton(
                    title: AppLocalizations.of(context).next,
                    hint: AppLocalizations.of(context).next,
                    onPressed: () {
                      Get.toNamed(Routes.onBoarding2);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

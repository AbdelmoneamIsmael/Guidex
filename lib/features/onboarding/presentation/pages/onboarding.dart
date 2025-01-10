import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/helper/responsive_helper.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/widgets/primary_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Semantics(
                    image: true,
                    label: "Qr Code Application Logo",
                    hint: "This is the Qr Code of Guidix Application",
                    child: Image.asset(
                      "assets/images/qrcode.png",
                    ),
                  ),
                ],
              ),
            ),
            PrimaryButton(
              onPressed: () {
                Get.toNamed(Routes.registerScreen);
              },
              title: "Sign Up",
              lable: "Sign Up Navigation Button",
              hint: "Double tap to sign up",
            ),
            SizedBox(
              height: 24.responsiveHeight(context),
            ),
            PrimaryButton(
              onPressed: () {
                Get.toNamed(Routes.loginScreen);
              },
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              forGroundColor: Theme.of(context).primaryColor,
              title: AppLocalizations.of(context).helloWorld,
              lable: "Sign In Navigation Button",
              hint: "Double tap to sign In",
            ),
          ],
        ),
      ),
    );
  }
}

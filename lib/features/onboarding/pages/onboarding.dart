import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_controller/app_controller.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/helper/responsive_helper.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/themes/theme/custom_theme.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/gen/assets.gen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.images.onboarding.path,
          ),
          Container(
              
          )
        ],
      ),
    );
  }
}

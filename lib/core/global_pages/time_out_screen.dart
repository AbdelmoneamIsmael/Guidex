import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/gen/assets.gen.dart';

class TimeErrorScreen extends StatelessWidget {
  const TimeErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.images.timeout.path,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.14,
            left: MediaQuery.of(context).size.width * 0.065,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 25,
                    color: const Color(0xFF59618B).withOpacity(0.37),
                  ),
                ],
              ),
              child: PrimaryButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                title: AppLocalizations.of(context).retry,
              ),
            ),
          )
        ],
      ),
    );
  }
}

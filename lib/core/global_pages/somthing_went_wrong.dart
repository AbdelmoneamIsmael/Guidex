import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/gen/assets.gen.dart';

class SomthingWentWrongScreen extends StatelessWidget {
  const SomthingWentWrongScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.images.error.path,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 13),
                    blurRadius: 25,
                    color: const Color(0xFF5666C2).withOpacity(0.17),
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

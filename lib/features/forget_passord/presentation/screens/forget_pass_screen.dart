import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/features/forget_passord/controller/forget_pass_controller.dart';

class ForgetPassScreen extends GetView<ForgetPassController> {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: GuidixAppBar(
          title: controller.currentTitle[controller.currentStep.value],
          onBack: () => controller.backStep(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              32.verticalSpace,
              Row(
                spacing: 8.w,
                children: List.generate(
                  controller.currentPage.length,
                  (index) => Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 4.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: index == controller.currentStep.value
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).colorScheme.scrim,
                      ),
                    ),
                  ),
                ),
              ),
              controller.currentPage[controller.currentStep.value],
            ],
          ),
        ),
      ),
    );
  }
}

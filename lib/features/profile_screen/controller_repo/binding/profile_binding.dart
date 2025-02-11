import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/features/profile_screen/controller_repo/controller/profile_controller.dart';

class ProfileBinding extends Bindings {
   ProfileBinding(
     {required this.context}  
   );
   final BuildContext context;
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(
      context: context
    ));
  }
}
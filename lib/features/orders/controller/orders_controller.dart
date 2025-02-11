import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  int selectedPage = 0;
  PageController pageController = PageController();
  void changeTap(int newIndex) {
    selectedPage = newIndex;
    pageController.jumpToPage(newIndex);
    update();
  }

  void changPage(int newIndex) {
    selectedPage = newIndex;
    update();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';

class AppContext {
  AppContext._();
  static late double height;
  static late double width;
  static late BuildContext context;
  static void init(BuildContext mainContext) {
    context = mainContext;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/features/orders/controller/orders_controller.dart';

class OrdersScreen extends GetView<OrdersController> {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: GuidixAppBar(title: AppLocalizations.of(context).orders),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GuidixAppBar(title: "CartScreen"),
    );
  }
}

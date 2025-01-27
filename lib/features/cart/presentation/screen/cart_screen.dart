import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/gen/assets.gen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GuidixAppBar(title: "CartScreen"),
      body: Center(
        child: SvgPicture.asset(Assets.icons.emptyCartSvg),
      ),
    );
  }
}

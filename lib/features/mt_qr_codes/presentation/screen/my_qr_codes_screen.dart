import 'package:flutter/material.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';

class MyQrCodesScreen extends StatelessWidget {
  const MyQrCodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GuidixAppBar(title: "MyQrCodesScreen"),
    );
  }
}
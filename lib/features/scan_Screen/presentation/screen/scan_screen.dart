import 'package:flutter/material.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GuidixAppBar(title: "ScannerSCreen"),
    );
  }
}
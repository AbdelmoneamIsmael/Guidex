import 'package:flutter/material.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GuidixAppBar(title: "CommunityScreen"),
    );
  }
}
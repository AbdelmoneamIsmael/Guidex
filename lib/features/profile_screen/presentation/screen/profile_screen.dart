import 'package:flutter/material.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuidixAppBar(title: AppLocalizations.of(context).myAccount),
      body: const Center(child: Text("ProfileScreen")),
    );
  }
}

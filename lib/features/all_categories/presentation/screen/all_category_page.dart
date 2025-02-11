import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/features/all_categories/presentation/widget/category_widget.dart';

class AllCategoryPage extends StatelessWidget {
  const AllCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuidixAppBar(
        title: AppLocalizations.of(context).category,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          title: AppLocalizations.of(context).addCategory,
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: const Column(
          children: [
            Wrap(
              children: [
                CategoryWidget(
                  title: "Medcine",
                ),
                CategoryWidget(
                  title: "Clothes",
                ),
                CategoryWidget(
                  title: "Kitchen",
                ),
                CategoryWidget(
                  title: "Panties",
                ),
                CategoryWidget(
                  title: "Books",
                ),
                CategoryWidget(
                  title: "Playstation",
                ),
                CategoryWidget(
                  title: "Shoes",
                ),
                CategoryWidget(
                  title: "Medcine",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

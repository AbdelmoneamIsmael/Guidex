import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/app_textfield.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/core/widgets/loading_over_lay.dart';
import 'package:guidix/core/widgets/no_data_widget.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/core/widgets/ui_helper.dart';
import 'package:guidix/features/all_categories/controller_repo/controller/all_categories_controller.dart';
import 'package:guidix/features/all_categories/presentation/widget/category_widget.dart';
import 'package:guidix/features/my_qr_codes/data/model/category_model.dart';
import 'package:guidix/gen/assets.gen.dart';

class AllCategoryPage extends GetView<AllCategoriesController> {
  const AllCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: GuidixAppBar(
            title: AppLocalizations.of(context).category,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: PrimaryButton(
              title: AppLocalizations.of(context).addCategory,
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    isDismissible: true,
                    enableDrag: true,
                    showDragHandle: true,
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.6,
                        minWidth: MediaQuery.of(context).size.width),
                    builder: (context) {
                      return const AddCategorySheetView();
                    });
              },
            ),
          ),
          body: GetBuilder<AllCategoriesController>(builder: (controller) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                children: [
                  controller.categories.isEmpty
                      ? NoDataWidget(
                          iconPath: Assets.icons.category,
                          title: AppLocalizations.of(context).noCategory,
                          description: AppLocalizations.of(context)
                              .noCategoryDescription,
                        )
                      : Wrap(
                          children: List.generate(
                          controller.categories.length,
                          (index) => CategoryWidget(
                            category: controller.categories[index],
                            onTap: () {
                              controller.pickCategory(
                                  category: controller.categories[index]);
                            
                            },
                            onEdit: () {
                              controller.prepareCategoryForUpdate(
                                  category: controller.categories[index]);
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  isDismissible: true,
                                  enableDrag: true,
                                  showDragHandle: true,
                                  constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      minWidth:
                                          MediaQuery.of(context).size.width),
                                  builder: (context) {
                                    return EditCategorySheetView(
                                      category: controller.categories[index],
                                    );
                                  });
                            },
                            onDelete: () {
                              UIHelper.showModal(
                                context: context,
                                title:
                                    AppLocalizations.of(context).deleteCategory,
                                message: AppLocalizations.of(context)
                                    .deleteCategoryMessage,
                                buttonText: AppLocalizations.of(context).delete,
                                buttonAction: () {
                                  Get.back();
                                  controller.deleteCategory(
                                    context: context,
                                    category: controller.categories[index],
                                  );
                                },
                              );
                            },
                          ),
                        ))
                ],
              ),
            );
          }),
        ),
        GetBuilder<AllCategoriesController>(builder: (controller) {
          return Visibility(
            visible: controller.isLoading,
            child: const LoadingOverlay(),
          );
        })
      ],
    );
  }
}

class AddCategorySheetView extends GetView<AllCategoriesController> {
  const AddCategorySheetView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context).addNewCategory,
            style: AppTextStyle.simiBold16(context),
          ),
          16.verticalSpace,
          Text(
            AppLocalizations.of(context).addCategoryHint,
            textAlign: TextAlign.center,
            style: AppTextStyle.regular12(context).copyWith(
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
          ).paddingAll(16),
          AppTextField(
            hintText: AppLocalizations.of(context).arabicName,
            semanticLabel: AppLocalizations.of(context).arabicName,
            controller: controller.arabicNameController,
          ),
          16.verticalSpace,
          AppTextField(
            hintText: AppLocalizations.of(context).englishName,
            semanticLabel: AppLocalizations.of(context).englishName,
            controller: controller.englishNameController,
          ),
          16.verticalSpace,
          PrimaryButton(
            title: AppLocalizations.of(context).add,
            onPressed: () {
              controller.addCategory(context: context);
            },
          )
        ],
      ),
    );
  }
}

class EditCategorySheetView extends GetView<AllCategoriesController> {
  const EditCategorySheetView({
    required this.category,
    super.key,
  });

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context).editCategory,
            style: AppTextStyle.simiBold16(context),
          ),
          16.verticalSpace,
          Text(
            AppLocalizations.of(context).addCategoryHint,
            textAlign: TextAlign.center,
            style: AppTextStyle.regular12(context).copyWith(
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
          ).paddingAll(16),
          AppTextField(
            hintText: AppLocalizations.of(context).arabicName,
            semanticLabel: AppLocalizations.of(context).arabicName,
            controller: controller.arabicNameController,
          ),
          16.verticalSpace,
          AppTextField(
            hintText: AppLocalizations.of(context).englishName,
            semanticLabel: AppLocalizations.of(context).englishName,
            controller: controller.englishNameController,
          ),
          16.verticalSpace,
          PrimaryButton(
            title: AppLocalizations.of(context).edit,
            onPressed: () {
              controller.updateCategory(context: context, category: category);
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_controller/app_controller.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/themes/colors/colors.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/app_textfield.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/core/widgets/loading.dart';
import 'package:guidix/core/widgets/no_data_widget.dart';
import 'package:guidix/core/widgets/ui_helper.dart';
import 'package:guidix/features/add_new_qr/presentation/screen/add_new_qr.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/controller/my_qr_controller.dart';
import 'package:guidix/features/my_qr_codes/data/model/qrcode_model.dart';
import 'package:guidix/features/scan_Screen/presentation/screen/scan_screen.dart';
import 'package:guidix/gen/assets.gen.dart';

class MyQrCodesScreen extends GetView<MyQrController> {
  const MyQrCodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuidixAppBar(
        title: AppLocalizations.of(context).myQrCode,
        actions: [
          // option
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16).w,
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: 24.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: GuidixFormField(
                hintText: AppLocalizations.of(context).search,
                semanticLabel: "semanticLabel",
                controller: controller.searchController,
                onChanged: (value) {
                  controller.resetAll();
                },
                prefixIcon: SvgPicture.asset(
                  Assets.icons.search,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            GetBuilder<MyQrController>(builder: (controller) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 24).h,
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context).category,
                        style: AppTextStyle.medium16(context),
                      ),
                      Text(
                        " : ",
                        style: AppTextStyle.medium16(context),
                      ),
                      Text(
                        Get.find<AppController>().languageAr()
                            ? controller.selectedCategory.nameAr ?? ""
                            : controller.selectedCategory.nameEn ?? "",
                        style: AppTextStyle.regular16(context),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            Routes.allCategories,
                            arguments: {
                              "category": controller.selectedCategory
                            },
                          )?.then(
                            (value) => controller.resetAll(),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context).seeAll,
                          style: AppTextStyle.regular16(context).copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            GetBuilder<MyQrController>(
              builder: (controller) => controller.isInitialLoading
                  ? const SliverToBoxAdapter()
                  : controller.qrCodes.isEmpty
                      ? SliverToBoxAdapter(
                          child: NoDataWidget(
                            title: AppLocalizations.of(context).noQrcode,
                            description: AppLocalizations.of(context)
                                .noQrcodeDescription,
                            iconPath: Assets.icons.qrcode,
                          ),
                        )
                      : SliverList.separated(
                          itemBuilder: (context, index) => QrCodeItem(
                            onDelete: () {
                              UIHelper.showModal(
                                  message:
                                      "${AppLocalizations.of(context).deleteCategoryMessage}${Get.find<AppController>().languageAr() ? controller.qrCodes[index].copyWith().nameAr : controller.qrCodes[index].copyWith().nameEn}",
                                  title: AppLocalizations.of(context)
                                      .deleteQrcodeTitle,
                                  buttonAction: () {
                                    controller.deleteQrCode(
                                      controller.qrCodes[index].copyWith(),
                                    );
                                    Get.back();
                                  },
                                  context: context);
                            },
                            qrcodeModel: controller.qrCodes[index],
                          ),
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 16),
                          itemCount: controller.qrCodes.length,
                        ),
            ),
            GetBuilder<MyQrController>(
              builder: (controller) => SliverToBoxAdapter(
                child: controller.isLoading
                    ? const LoadingWidget()
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QrCodeItem extends StatelessWidget {
  const QrCodeItem(
      {super.key, required this.qrcodeModel, required this.onDelete});
  final QrcodeModel qrcodeModel;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.qrCodeDetails,
          arguments: {"qrCodeModel": qrcodeModel}),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarTheme.color,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7).w,
          child: Row(
            children: [
              SizedBox(
                height: 69.h,
                width: 65.w,
                child: QrcodeWidget(
                  qrCodeID: qrcodeModel.code ?? "abdelmoneam",
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4.h,
                  children: [
                    Text(
                      Get.find<AppController>().languageAr()
                          ? qrcodeModel.nameAr ?? ""
                          : qrcodeModel.nameEn ?? "",
                      style: AppTextStyle.simiBold16(context),
                    ),
                    Text(
                      Get.find<AppController>().languageAr()
                          ? qrcodeModel.categoryNameAr ?? ""
                          : qrcodeModel.categoryNameEn ?? "",
                      style: AppTextStyle.regular16(context),
                    ),
                    Text(
                      Get.find<AppController>().languageAr()
                          ? qrcodeModel.descriptionAr ?? ""
                          : qrcodeModel.descriptionEn ?? "",
                      maxLines: 1,
                      style: AppTextStyle.regular12(context).copyWith(
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              CircleOption(
                hint: AppLocalizations.of(context).deleteCategory,
                padding: 7,
                svg: Assets.icons.delete,
                color: LightColors.redColor,
                onPresss: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

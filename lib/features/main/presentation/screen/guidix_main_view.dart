import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/features/main/controller_repo/controller/main_controller.dart';
import 'package:guidix/gen/assets.gen.dart';

class GuidixMainView extends GetView<MainController> {
  const GuidixMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => Scaffold(
        body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: Routes.scannerScreen,
          onGenerateRoute: (settings) {
            return controller.onGenerateRoute(settings, context);
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          shape: const CircleBorder(),
          onPressed: () {
            controller.changePage(2);
          },
          child: SvgPicture.asset(
            Assets.icons.scanner,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 65.h,
          color: Theme.of(context).bottomAppBarTheme.color,
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GuidixNaveItem(
                isSelected: controller.currentIndex == 0,
                title: AppLocalizations.of(context).community,
                svg: Assets.icons.community,
                onPressed: () {
                  controller.changePage(0);
                },
              ),
              GuidixNaveItem(
                isSelected: controller.currentIndex == 1,
                title: AppLocalizations.of(context).cart,
                svg: Assets.icons.cart,
                onPressed: () {
                  controller.changePage(1);
                },
              ),
              SizedBox(width: 40.w),
              GuidixNaveItem(
                isSelected: controller.currentIndex == 3,
                title: AppLocalizations.of(context).qrcode,
                svg: Assets.icons.qr,
                onPressed: () {
                  controller.changePage(3);
                },
              ),
              GuidixNaveItem(
                isSelected: controller.currentIndex == 4,
                title: AppLocalizations.of(context).myAccount,
                svg: Assets.icons.user,
                onPressed: () {
                  controller.changePage(4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GuidixNaveItem extends StatelessWidget {
  const GuidixNaveItem({
    super.key,
    required this.title,
    required this.svg,
    this.onPressed,
    required this.isSelected,
  });

  final String title, svg;
  final VoidCallback? onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: title,
      child: IconButton(
        icon: Column(
          children: [
            SvgPicture.asset(
              svg,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
              height: 24.h,
              width: 24.w,
            ),
            4.verticalSpace,
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: AppTextStyle.regular12(context).copyWith(
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).iconTheme.color,
                ),
              ),
            )
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}

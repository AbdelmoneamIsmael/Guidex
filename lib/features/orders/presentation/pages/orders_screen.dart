import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/features/orders/controller/orders_controller.dart';
import 'package:guidix/features/orders/presentation/views/cancelled_orders.dart';
import 'package:guidix/features/orders/presentation/views/completed_orders.dart';
import 'package:guidix/features/orders/presentation/views/track_order_view.dart';

class OrdersScreen extends GetView<OrdersController> {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuidixAppBar(title: AppLocalizations.of(context).orders),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16),
        child: GetBuilder<OrdersController>(
          builder: (controller) {
            return Column(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  child: IntrinsicWidth(
                    child: Row(
                      spacing: 20.w,
                      children: [
                        SelectableWidget(
                          title: AppLocalizations.of(context).trackOrder,
                          isSelected: controller.selectedPage == 0,
                          onTap: () {
                            controller.changeTap(0);
                          },
                        ),
                        SelectableWidget(
                          title: AppLocalizations.of(context).completed,
                          isSelected: controller.selectedPage == 1,
                          onTap: () {
                            controller.changeTap(1);
                          },
                        ),
                        SelectableWidget(
                          title: AppLocalizations.of(context).cancelled,
                          isSelected: controller.selectedPage == 2,
                          onTap: () {
                            controller.changeTap(2);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: controller.changPage,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      TrackOrderView(),
                      CompletedOrders(),
                      CancelledOrders(),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class SelectableWidget extends StatelessWidget {
  const SelectableWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.regular16(context).copyWith(
              color: isSelected ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/const/enum.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/features/orders/presentation/widgets/order_widget.dart';
import 'package:guidix/gen/assets.gen.dart';

class  CompletedOrders extends StatelessWidget {
  const CompletedOrders ({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 164 / 248,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => const OrderWidget(
        orderStatus: OrderStatus.completed,
      ),
      itemCount: 10,
    );
  }
}

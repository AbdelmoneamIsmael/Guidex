import 'package:flutter/material.dart';
import 'package:guidix/core/const/enum.dart';
import 'package:guidix/features/orders/presentation/widgets/order_widget.dart';

class CancelledOrders extends StatelessWidget {
  const CancelledOrders({super.key});

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
        orderStatus: OrderStatus.cancelled,
      ),
      itemCount: 10,
    );
  }
}

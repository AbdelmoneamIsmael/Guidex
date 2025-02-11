import 'package:get/get.dart';
import 'package:guidix/features/orders/controller/orders_controller.dart';

class OrdersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(() => OrdersController());
  }
}

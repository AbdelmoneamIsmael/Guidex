import 'package:get/get.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/category_repo.dart';

class MyQrController extends GetxController {
  MyQrController({
    required this.categoryRepo,
  });
  final CategoryRepo categoryRepo;
  
}

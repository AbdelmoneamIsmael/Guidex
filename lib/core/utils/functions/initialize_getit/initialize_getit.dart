import 'package:get_it/get_it.dart';
import 'package:guidix/features/login/data/repo/get_user_info_imple.dart';
import 'package:guidix/features/login/repo/login_repo.dart';

final GetIt getIt = GetIt.instance;

void initializeGetIt() {
  getIt.registerSingleton<GetUserInfoRepo>(GetUserInfoImple());
}

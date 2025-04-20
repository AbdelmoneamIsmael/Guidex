import 'package:get_it/get_it.dart';
import 'package:guidix/features/login/data/repo/get_user_info_imple.dart';
import 'package:guidix/features/login/repo/login_repo.dart';
import 'package:guidix/features/register/data/remote/register_user.dart';
import 'package:guidix/features/register/data/repo/register_repo_imple.dart';
import 'package:guidix/features/register/domain/repo/register_user_repo.dart';

final GetIt getIt = GetIt.instance;

void initializeGetIt() {
  getIt.registerSingleton<GetUserInfoRepo>(GetUserInfoImple());
  getIt.registerSingleton<RegisterUserRepo>(
      RegisterRepoImple(registerUserRemote: RegisterUserRemote()));
}

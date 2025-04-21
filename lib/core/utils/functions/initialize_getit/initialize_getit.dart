import 'package:get_it/get_it.dart';
import 'package:guidix/features/confirm_otp/data/datasources/remote/confirm_otp.dart';
import 'package:guidix/features/confirm_otp/data/datasources/remote/send_otp.dart';
import 'package:guidix/features/confirm_otp/data/repositories/confirm_otp_repo_imple.dart';
import 'package:guidix/features/confirm_otp/domain/repositories/confirm_otp_repo.dart';
import 'package:guidix/features/forget_passord/data/remote/change_password.dart';
import 'package:guidix/features/forget_passord/data/remote/remote_confirm_email.dart';
import 'package:guidix/features/forget_passord/data/repo/forget_password_repo.dart';
import 'package:guidix/features/login/data/repo/get_user_info_imple.dart';
import 'package:guidix/features/login/repo/login_repo.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/category_repo.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote/remote_add_category.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote/remote_delete_category.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote/remote_get_categories.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote/remote_get_category_by_id.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote/remote_update_category.dart';
import 'package:guidix/features/my_qr_codes/data/repo/category_repo_imple.dart';
import 'package:guidix/features/register/data/remote/register_user.dart';
import 'package:guidix/features/register/data/repo/register_repo_imple.dart';
import 'package:guidix/features/register/domain/repo/register_user_repo.dart';

final GetIt getIt = GetIt.instance;

void initializeGetIt() {
  getIt.registerSingleton<GetUserInfoRepo>(GetUserInfoImple());
  getIt.registerSingleton<RegisterUserRepo>(
    RegisterRepoImple(
      registerUserRemote: RegisterUserRemote(),
    ),
  );

  getIt.registerSingleton<ConfirmOtpRepo>(
    ConfirmOtpRepoImple(
      remoteSendOtp: RemoteSendOtp(),
      remoteConfirmOtp: RemoteConfirmOtp(),
    ),
  );

  getIt.registerSingleton<ForgetPasswordRepo>(
    ForgetPasswordRepo(
        remoteChangePassword: RemoteChangePassword(),
        remoteConfirmEmail: RemoteConfirmEmail()),
  );

  getIt.registerLazySingleton<CategoryRepo>(
    () => CategoryRepoImple(
      remoteGetCategories: RemoteGetCategories(),
      remoteGetCategoryByID: RemoteGetCategoryById(),
      remoteAddCategory: RemoteAddCategory(),
      remoteUpdateCategory: RemoteUpdateCategory(),
      remoteDeleteCategory: RemoteDeleteCategory(),
    ),
  );
}

import 'package:get_it/get_it.dart';
import 'package:guidix/features/communityScreen/data/remote_posts/getting_posts.dart';
import 'package:guidix/features/communityScreen/data/repo/getting_community_posts_repo_imple.dart';
import 'package:guidix/features/communityScreen/domain/repo/get_community_post_repo.dart';
import 'package:guidix/features/confirm_otp/data/datasources/remote/confirm_otp.dart';
import 'package:guidix/features/confirm_otp/data/datasources/remote/send_otp.dart';
import 'package:guidix/features/confirm_otp/data/repositories/confirm_otp_repo_imple.dart';
import 'package:guidix/features/confirm_otp/domain/repositories/confirm_otp_repo.dart';
import 'package:guidix/features/edit_profile/data/remote/remote_update_data.dart';
import 'package:guidix/features/edit_profile/data/repo/update_profile_repo_imple.dart';
import 'package:guidix/features/edit_profile/domain/repo/update_profile_repo.dart';
import 'package:guidix/features/forget_passord/data/remote/change_password.dart';
import 'package:guidix/features/forget_passord/data/remote/remote_confirm_email.dart';
import 'package:guidix/features/forget_passord/data/repo/forget_password_repo.dart';
import 'package:guidix/features/login/data/repo/get_user_info_imple.dart';
import 'package:guidix/features/login/repo/login_repo.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/category_repo.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/qrcode_repo.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote/remote_add_category.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote/remote_delete_category.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote/remote_get_categories.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote/remote_get_category_by_id.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote/remote_update_category.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote_qrcode/remote_asign_qrcode.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote_qrcode/remote_delete_qr.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote_qrcode/remote_get_qr_by_code.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote_qrcode/remote_get_qrcodes.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote_qrcode/remote_update_qr.dart';
import 'package:guidix/features/my_qr_codes/data/repo/category_repo_imple.dart';
import 'package:guidix/features/my_qr_codes/data/repo/qr_code_repo_imple.dart';
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
  getIt.registerLazySingleton<QrcodeRepo>(
    () => QrCodeRepoImple(
      remoteGetQrByCode: RemoteGetQrByCode(),
      remoteDeleteQr: RemoteDeleteQr(),
      remoteUpdateQr: RemoteUpdateQr(),
      remoteAddQrCode: RemoteAsignQrcode(),
      remoteGetQrcodes: RemoteGetQrcodes(),
    ),
  );
  getIt.registerLazySingleton<UpdateProfileRepo>(
    () => UpdateProfileRepoImple(
      updateProfileRemote: RemoteUpdateData(),
    ),
  );
  getIt.registerLazySingleton<GetCommunityPostRepo>(
    () => GettingCommunityPostsRepoImple(
      gettingRemotePosts: GettingRemotePosts(),
    ),
  );
}

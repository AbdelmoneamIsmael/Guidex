import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/core/models/user/user_model.dart';
import 'package:guidix/features/login/data/model/sign_in_social_model.dart';
import 'package:guidix/features/login/data/remote/facebook_login.dart';
import 'package:guidix/features/login/data/repo/sign_with_email.dart';
import 'package:guidix/features/login/data/repo/signin_repo.dart';

class SignWithFacebook extends SigninRepo with PerfumeSignIn {
  final FacebookLoginAuthRepo facebookLoginAuthRepo;

  SignWithFacebook({required this.facebookLoginAuthRepo});

  @override
  Future<Either<Failure, UserModel>> login() async {
    try {
      SocialSignIn result = await facebookLoginAuthRepo.loginWithFacebook();

      var userModel = await super.guidxSignIn(
        data: result.toJson(),
        endPoint: '/api/Authentication/ExternalLogin',
      );
      return userModel.fold(
        (l) {
          return Left(ServerFailure(code: l.code, message: l.message));
        },
        (r) {
          return Right(r);
        },
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(ServerFailure(code: e.hashCode, message: e.code));
      } else {
        return Left(
          ServerFailure(
            code: internalLocalError,
            message: e.toString(),
          ),
        );
      }
    }
  }
}

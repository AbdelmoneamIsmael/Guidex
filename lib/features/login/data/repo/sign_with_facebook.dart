import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:perfume_ecommerce/core/error/failure.dart';
import 'package:perfume_ecommerce/core/global_repo/repo/sign_in/signin_repo.dart';
import 'package:perfume_ecommerce/core/models/user/user_model.dart';
import 'package:perfume_ecommerce/features/login_page.dart/data/model/sign_in_social_model.dart';
import 'package:perfume_ecommerce/features/login_page.dart/data/remote/facebook_login.dart';
import 'package:perfume_ecommerce/features/login_page.dart/data/repo/sign_with_email.dart';

class SignWithFacebook extends SigninRepo with PerfumeSignIn {
  final FacebookLoginAuthRepo facebookLoginAuthRepo;

  SignWithFacebook({required this.facebookLoginAuthRepo});

  @override
  Future<Either<Failure, UserModel>> login() async {
    try {
      SocialSignIn result = await facebookLoginAuthRepo.loginWithFacebook();

      var userModel = await super.perfumeSignIn(
        data: result.toJson(),
        endPoint: '/api/Authentication/ExternalLogin',
      );
      return userModel.fold(
        (l) {
          return Left(ServerFailure(l.message));
        },
        (r) {
          return Right(r);
        },
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(ServerFailure(e.code));
      } else {
        return Left(ServerFailure(
          e.toString(),
        ));
      }
    }
  }
}

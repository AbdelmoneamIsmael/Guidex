import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/core/models/user/user_model.dart';
import 'package:guidix/core/utils/api/api_server.dart';
import 'package:guidix/features/login/data/model/google_response_model.dart';
import 'package:guidix/features/login/data/model/sign_in_social_model.dart';
import 'package:guidix/features/login/data/remote/google_login.dart';
import 'package:guidix/features/login/data/repo/sign_with_email.dart';
import 'package:guidix/features/login/data/repo/signin_repo.dart';


class SignWithGoogleRepo extends SigninRepo with PerfumeSignIn {
  final GoogleLogin googleLogin;
  @override
  final ApiServer apiServer = ApiServer();
  SignWithGoogleRepo({required this.googleLogin});

  @override
  Future<Either<Failure, UserModel>> login() async {
    try {
      var result = await googleLogin.signInWithGoogle();
      SocialSignIn googleResponseModel =
          GoogleResponseModel.fromUserCredentials(
        result,
      );
      var userModel = await super.perfumeSignIn(
        data: googleResponseModel.toJson(),
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

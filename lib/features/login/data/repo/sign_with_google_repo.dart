import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';


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

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/features/edit_profile/data/remote/remote_update_data.dart';
import 'package:guidix/features/edit_profile/domain/entity/person_edit_params.dart';
import 'package:guidix/features/edit_profile/domain/repo/update_profile_repo.dart';

class UpdateProfileRepoImple extends UpdateProfileRepo {
  final RemoteUpdateData updateProfileRemote;

  UpdateProfileRepoImple({required this.updateProfileRemote});
  @override
  Future<Either<Failure, BasicResponseModel>> updateProfile(
      PersonEditModelParams personEditModelParams) async {
    try {
      var result = await updateProfileRemote.updateData(
          userProfile: personEditModelParams);
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
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

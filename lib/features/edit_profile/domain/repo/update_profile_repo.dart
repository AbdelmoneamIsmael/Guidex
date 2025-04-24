import 'package:dartz/dartz.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/features/edit_profile/domain/entity/person_edit_params.dart';

abstract class UpdateProfileRepo {
  Future<Either<Failure, BasicResponseModel>> updateProfile(
    PersonEditModelParams personEditModelParams,
  );
  
}

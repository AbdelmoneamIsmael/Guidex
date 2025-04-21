import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/category_repo.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote/remote_add_category.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote/remote_delete_category.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote/remote_get_categories.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote/remote_get_category_by_id.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote/remote_update_category.dart';
import 'package:guidix/features/my_qr_codes/data/model/category_model.dart';
import 'package:guidix/features/my_qr_codes/data/model/category_responce_model.dart';

class CategoryRepoImple extends CategoryRepo {
  final RemoteAddCategory remoteAddCategory;
  final RemoteDeleteCategory remoteDeleteCategory;
  final RemoteGetCategories remoteGetCategories;
  final RemoteGetCategoryById remoteGetCategoryByID;
  final RemoteUpdateCategory remoteUpdateCategory;

  CategoryRepoImple(
      {required this.remoteAddCategory,
      required this.remoteDeleteCategory,
      required this.remoteGetCategories,
      required this.remoteGetCategoryByID,
      required this.remoteUpdateCategory});

  @override
  Future<Either<Failure, BasicResponseModel>> addCategory(
      {required String arName, required String enName}) async {
    try {
      var result =
          await remoteAddCategory.addCategory(arName: arName, enName: enName);
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(
            ServerFailure(code: internalLocalError, message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, BasicResponseModel>> deleteCategory(
      {required int id}) async {
    try {
      var result = await remoteDeleteCategory.deleteCategory(id: id);
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(
          ServerFailure(code: internalLocalError, message: e.toString()),
        );
      }
    }
  }

  @override
  Future<Either<Failure, CategoryResponceModel>> getCategories(
      {bool isPagenation = true,
      required int pageIndex,
      required int pageSize,
      String? searchKey}) async {
    try {
      var result = await remoteGetCategories.getCategories(
        searchKey: searchKey,
        pageIndex: pageIndex,
        pageSize: pageSize,
      );
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(
          ServerFailure(code: internalLocalError, message: e.toString()),
        );
      }
    }
  }

  @override
  Future<Either<Failure, CategoryModel>> getCategoryByID(
      {required int id}) async {
    try {
      var result =
          await remoteGetCategoryByID.getCategoryById(id: id.toString());
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(
          ServerFailure(code: internalLocalError, message: e.toString()),
        );
      }
    }
  }

  @override
  Future<Either<Failure, BasicResponseModel>> updateCategory(
      {required CategoryModel category}) async {
    try {
      var result =
          await remoteUpdateCategory.updateCategory(category: category);
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(
          ServerFailure(code: internalLocalError, message: e.toString()),
        );
      }
    }
  }
}

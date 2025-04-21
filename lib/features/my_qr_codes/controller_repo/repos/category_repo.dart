import 'package:dartz/dartz.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/features/my_qr_codes/data/model/category_model.dart';
import 'package:guidix/features/my_qr_codes/data/model/category_responce_model.dart';

abstract class CategoryRepo {
  Future<Either<Failure, CategoryResponceModel>> getCategories({
    bool isPagenation = true,
    required int pageIndex,
    required int pageSize,
    String? searchKey,
  });
  Future<Either<Failure, CategoryModel>> getCategoryByID({
    required int id,
  });
  Future<Either<Failure, BasicResponseModel>> addCategory({
    required Map<String, dynamic> data,
  });
  Future<Either<Failure, BasicResponseModel>> updateCategory({
    required CategoryModel category,
  });
  Future<Either<Failure, BasicResponseModel>> deleteCategory({required int id});
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/qrcode_repo.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote_qrcode/remote_asign_qrcode.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote_qrcode/remote_delete_qr.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote_qrcode/remote_get_qr_by_code.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote_qrcode/remote_get_qrcodes.dart';
import 'package:guidix/features/my_qr_codes/data/database/remote_qrcode/remote_update_qr.dart';
import 'package:guidix/features/my_qr_codes/data/model/qrcode_model.dart';
import 'package:guidix/features/my_qr_codes/data/model/qrcode_responce_model.dart';

class QrCodeRepoImple extends QrcodeRepo {
  final RemoteGetQrByCode remoteGetQrByCode;
  final RemoteDeleteQr remoteDeleteQr;
  final RemoteUpdateQr remoteUpdateQr;
  final RemoteAsignQrcode remoteAddQrCode;
  final RemoteGetQrcodes remoteGetQrcodes;

  QrCodeRepoImple(
      {required this.remoteGetQrByCode,
      required this.remoteDeleteQr,
      required this.remoteUpdateQr,
      required this.remoteAddQrCode,
      required this.remoteGetQrcodes});
  @override
  Future<Either<Failure, BasicResponseModel>> addQrCode(
      {required QrcodeModel qrcode}) {
    // TODO: implement addQrCode
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BasicResponseModel>> deleteQrCode(
      {required List<String> codes}) async {
    try {
      var result = await remoteDeleteQr.deleteQrCode(codes: codes);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
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

  @override
  Future<Either<Failure, QrcodeResponceModel>> getAllQrcodes({
    bool isPagenation = true,
    required int pageIndex,
    required int pageSize,
    String? searchKey,
    int? categoryId,
  }) async {
    try {
      var result = await remoteGetQrcodes.getQrcodes(
        pageIndex: pageIndex,
        pageSize: pageSize,
        searchKey: searchKey,
        categoryId: categoryId,
      );
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
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

  @override
  Future<Either<Failure, QrcodeModel>> getQrCode({required String code}) async {
    try {
      var result = await remoteGetQrByCode.getQrByCode(code: code.toString());
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
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

  @override
  Future<Either<Failure, BasicResponseModel>> updateQrCode(
      {required QrcodeModel qrcode}) async {
    try {
      var result = await remoteUpdateQr.updateQr(qrcodeModel: qrcode);
      return Right(result);
    } catch (e) {
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

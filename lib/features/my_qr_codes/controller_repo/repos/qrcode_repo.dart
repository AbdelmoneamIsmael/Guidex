import 'package:dartz/dartz.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/features/my_qr_codes/data/model/qrcode_model.dart';
import 'package:guidix/features/my_qr_codes/data/model/qrcode_responce_model.dart';

abstract class QrcodeRepo {
  Future<Either<Failure, QrcodeModel>> getQrCode({required String code});
  Future<Either<Failure, QrcodeResponceModel>> getAllQrcodes({
    bool isPagenation = true,
    required int pageIndex,
    required int pageSize,
    String? searchKey,
    int? categoryId,
  });
  Future<Either<Failure, BasicResponseModel>> deleteQrCode(
      {required List<String> codes});
  Future<Either<Failure, BasicResponseModel>> updateQrCode({
    required QrcodeModel qrcode,
  });
  Future<Either<Failure, BasicResponseModel>> addQrCode({
    required QrcodeModel qrcode,
  });
}

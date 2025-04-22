import 'package:dio/dio.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/core/utils/api/api_server.dart';
import 'package:guidix/features/my_qr_codes/data/model/qrcode_model.dart';

class RemoteUpdateQr {
  ApiServer apiServer = ApiServer();
  Future<BasicResponseModel> updateQr(
      {required QrcodeModel qrcodeModel}) async {
    var result = await apiServer.post(
      endPoint: "/api/QRCodeModel/UpdateQRCodeModel",
      data: FormData.fromMap(qrcodeModel.toJson()),
      additionalHeaders: {"Content-Type": "multipart/form-data"},
    );
    BasicResponseModel basicResponseModel = BasicResponseModel.fromJson(result);
    return basicResponseModel;
  }
}

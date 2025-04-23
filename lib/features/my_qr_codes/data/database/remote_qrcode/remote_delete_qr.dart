import 'package:dio/dio.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/core/utils/api/api_server.dart';

class RemoteDeleteQr {
  ApiServer apiServer = ApiServer();

  Future<BasicResponseModel> deleteQrCode({required List<String> codes}) async {
    var result = await apiServer.post(
      endPoint: "/api/QRCodeModel/DeleteQRCodeModel",
      data: FormData.fromMap({"codes": codes}),
      additionalHeaders: {"Content-Type": "multipart/form-data"},
    );
    BasicResponseModel basicResponseModel = BasicResponseModel.fromJson(result);
    return basicResponseModel;
  }
}

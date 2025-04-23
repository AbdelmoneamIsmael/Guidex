import 'package:guidix/core/utils/api/api_server.dart';
import 'package:guidix/features/my_qr_codes/data/model/qrcode_responce_model.dart';

class RemoteGetQrcodes {
  ApiServer apiServer = ApiServer();
  Future<QrcodeResponceModel> getQrcodes(
      {required int pageIndex,
      required int pageSize,
      String? searchKey,
      int? categoryId}) async {
    String url =
        '/api/QRCodeModel/GetAllQRCodeModels?pageIndex=$pageIndex&pageSize=$pageSize';
    if (categoryId != null) {
      if (categoryId != -1) {
        url += '&categoryId=$categoryId';
      }
    }
    if (searchKey != null) {
      if (searchKey.isNotEmpty) {
        url += '&Search=$searchKey';
      }
    }
    var result = await apiServer.getRequest(uri: url);
    QrcodeResponceModel qrcodeResponceModel =
        QrcodeResponceModel.fromJson(result);
    return qrcodeResponceModel;
  }
}

import 'package:guidix/core/utils/api/api_server.dart';
import 'package:guidix/features/my_qr_codes/data/model/qrcode_model.dart';

class RemoteGetQrByCode {
  ApiServer apiServer = ApiServer();

  Future<QrcodeModel> getQrByCode({required String code}) async {
    var result = await apiServer.getRequest(uri: '/api/QRCodeModel/GetQRCodeModelByCode?code=$code');
    QrcodeModel qrcodeModel = QrcodeModel.fromJson(result);
    return qrcodeModel;
  }
}

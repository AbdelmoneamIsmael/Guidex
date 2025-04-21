import 'package:guidix/core/utils/api/api_server.dart';
import 'package:guidix/features/my_qr_codes/data/model/category_model.dart';

class RemoteGetCategoryById {
  ApiServer apiServer = ApiServer();

  Future<CategoryModel> getCategoryById({required String id}) async {
    var result =
        await apiServer.getRequest(uri: '/api/Category/GetCategoryById?id=$id');
    CategoryModel categoryModel = CategoryModel.fromJson(result);
    return categoryModel;
  }
}

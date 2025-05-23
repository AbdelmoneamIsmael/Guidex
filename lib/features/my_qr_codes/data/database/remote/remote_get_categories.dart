import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/utils/api/api_server.dart';
import 'package:guidix/core/utils/cache_helper.dart';
import 'package:guidix/features/my_qr_codes/data/model/category_responce_model.dart';

class RemoteGetCategories {
  ApiServer apiServer = ApiServer();

  Future<CategoryResponceModel> getCategories({
    String? searchKey,
    required int pageIndex,
    required int pageSize,
  }) async {
    if (searchKey == null) {
      searchKey = '';
    } else {
      searchKey = "&Search=$searchKey";
    }
    print(
      await CacheHelper.getSecuerString(
        key: GetStoreageKey.accessToken,
      ),
    );
    print(
      await CacheHelper.getSecuerString(
        key: GetStoreageKey.refreshToken,
      ),
    );
    var result = await apiServer.getRequest(
      uri:
          '/api/Category/GetAllCategories?isPagingEnabled=true&pageIndex=$pageIndex&pageSize=$pageSize$searchKey',
    );
    CategoryResponceModel categoryResponceModel =
        CategoryResponceModel.fromJson(result);
    return categoryResponceModel;
  }
}

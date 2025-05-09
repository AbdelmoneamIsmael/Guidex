import 'package:guidix/core/utils/api/api_server.dart';
import 'package:guidix/features/communityScreen/data/model/community_reponce_posts_model.dart';

class GettingRemotePosts {
  final ApiServer apiServer = ApiServer();
  Future<CommunityPostsResponceModel> getPosts({
    required int pageIndex,
    required int pageSize,
    String? searchKey,
    required bool isPagingEnabled,
  }) async {
    String endPoint =
        "/api/Post/GetAllPost?isPagingEnabled=$isPagingEnabled&pageIndex=$pageIndex&pageSize=$pageSize";
    if (searchKey != null) {
      if (searchKey.isNotEmpty) {
        endPoint += '&Search=$searchKey';
      }
    }

    final response = await apiServer.getRequest(
      uri: endPoint,
    );
    CommunityPostsResponceModel communityPostsResponceModel =
        CommunityPostsResponceModel.fromJson(response);
    return communityPostsResponceModel;
  }
}

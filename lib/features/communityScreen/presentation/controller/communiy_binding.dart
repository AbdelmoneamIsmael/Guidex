import 'package:get/get.dart';
import 'package:guidix/core/utils/functions/initialize_getit/initialize_getit.dart';
import 'package:guidix/features/communityScreen/domain/repo/get_community_post_repo.dart';
import 'package:guidix/features/communityScreen/presentation/controller/community_controller.dart';

class CommuniyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommunityController(
          getCommunityPostRepo: getIt.get<GetCommunityPostRepo>(),
        ));
  }
}

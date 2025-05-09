import 'package:dartz/dartz.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/features/communityScreen/data/model/community_reponce_posts_model.dart';

abstract class GetCommunityPostRepo {
  Future<Either<Failure, CommunityPostsResponceModel>> getCommunityPosts({
    bool isPagingEnabled = true,
    required int pageIndex,
    required int pageSize,
    String? searchKey,
  });
}

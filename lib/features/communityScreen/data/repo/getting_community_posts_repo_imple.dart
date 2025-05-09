import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/features/communityScreen/data/model/community_reponce_posts_model.dart';
import 'package:guidix/features/communityScreen/data/remote_posts/getting_posts.dart';
import 'package:guidix/features/communityScreen/domain/repo/get_community_post_repo.dart';

class GettingCommunityPostsRepoImple extends GetCommunityPostRepo {
  final GettingRemotePosts gettingRemotePosts;

  GettingCommunityPostsRepoImple({required this.gettingRemotePosts});

  @override
  Future<Either<Failure, CommunityPostsResponceModel>> getCommunityPosts(
      {bool isPagingEnabled = true,
      required int pageIndex,
      required int pageSize,
      String? searchKey}) async {
    try {
      var result = await gettingRemotePosts.getPosts(
        pageIndex: pageIndex,
        pageSize: pageSize,
        searchKey: searchKey,
        isPagingEnabled: isPagingEnabled,
      );
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(
          ServerFailure(
            code: internalLocalError,
            message: e.toString(),
          ),
        );
      }
    }
  }
}

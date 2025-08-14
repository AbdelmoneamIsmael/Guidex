import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/widgets/ui_helper.dart';
import 'package:guidix/features/communityScreen/data/model/post_model.dart';
import 'package:guidix/features/communityScreen/domain/repo/get_community_post_repo.dart';

class CommunityController extends GetxController {
  final GetCommunityPostRepo getCommunityPostRepo;

  CommunityController({required this.getCommunityPostRepo});
  List<PostsModel> posts = [];

  bool isThereMoreItems = true;
  bool isLoading = false;
  bool isInitialLoading = false;
  int pageIndex = 1;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    getAllPosts();
    scrollController.addListener(_onScroll);
    super.onInit();
  }

  void _onScroll() {
    if (scrollController.hasClients) {
      double currentPosition = scrollController.position.pixels;
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      double seventyPercentOffset = maxScrollExtent * 0.7;
      if (currentPosition >= seventyPercentOffset &&
          isThereMoreItems &&
          isLoading == false &&
          isInitialLoading == false) {
        getAllPosts();
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void getAllPosts() async {
    isLoading = true;
    if (posts.isEmpty) {
      isInitialLoading = true;
    }
    update();
    try {
      var result = await getCommunityPostRepo.getCommunityPosts(
        pageIndex: pageIndex,
        pageSize: 10,
      );
      result.fold((l) {
        isLoading = false;
        isInitialLoading = false;
        update();
        UIHelper.showSnackbar(context: Get.context!, message: l.message);
      }, (r) {
        isLoading = false;
        isInitialLoading = false;

        posts.addAll(r.data);
        isThereMoreItems = r.hasNextPage!;
        pageIndex++;
        update();
      });
    } catch (e) {
      isLoading = false;
      isInitialLoading = false;
      update();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/core/widgets/loading.dart';
import 'package:guidix/features/communityScreen/presentation/controller/community_controller.dart';
import 'package:guidix/features/communityScreen/presentation/view/empity_community.dart';
import 'package:guidix/features/communityScreen/presentation/widget/community_option_widget.dart';
import 'package:guidix/gen/assets.gen.dart';

class CommunityScreen extends GetView<CommunityController> {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuidixAppBar(
        title: AppLocalizations.of(context).community,
      ),
      body: GetBuilder<CommunityController>(builder: (controller) {
        return CustomScrollView(
          controller: controller.scrollController,
          slivers:
              controller.posts.isEmpty && controller.isInitialLoading == false
                  ? [
                      const SliverToBoxAdapter(
                        child: EmpityCommunityView(),
                      ),
                    ]
                  : [
                      SliverToBoxAdapter(
                        
                      ),
                      if (controller.isLoading)
                        const SliverToBoxAdapter(
                          child: LoadingWidget(),
                        ),
                    ],
        );
      }),
    );
  }
}

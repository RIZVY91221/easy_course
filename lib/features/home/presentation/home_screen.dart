import 'dart:ffi';

import 'package:bs_assignment/core/base/base_view.dart';
import 'package:bs_assignment/core/enum.dart';
import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/uttils/icons.dart';
import 'package:bs_assignment/core/values/values.dart';
import 'package:bs_assignment/core/widget/global/button/app_button.dart';
import 'package:bs_assignment/core/widget/global/card/card2.dart';
import 'package:bs_assignment/core/widget/global/input_field/app_input.dart';
import 'package:bs_assignment/core/widget/global/loading/wid_loading_skeleton.dart';
import 'package:bs_assignment/core/widget/global/modal/app_modal.dart';
import 'package:bs_assignment/core/widget/global/pagination/pagging_view.dart';
import 'package:bs_assignment/core/widget/global/sidebar/wid_appbar.dart';
import 'package:bs_assignment/core/widget/user/comment_modal.dart';
import 'package:bs_assignment/core/widget/user/fab_bottom_app_bar.dart';
import 'package:bs_assignment/generated/assets.dart';
import 'package:bs_assignment/models/community_posts/feed_response.dart';
import 'package:bs_assignment/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeScreen extends BaseView<HomeController> {
  HomeScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return baseAppBar(
      titleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.headline5("Python Developer Community", color: AppColor.whiteFFFFFF),
          AppText.bodyExtraSmall("#General", color: AppColor.whiteFFFFFF),
        ],
      ),
      leadingArrow: false,
      hideLeading: false,
      backgroundColor: AppColor.primaryOne4B9EFF,
      toolbarHeight: 100,
    );
  }

  @override
  Color pageBackgroundColor() {
    return AppColor.scaffoldColor;
  }

  @override
  Color statusBarColor() {
    return AppColor.primaryOne4B9EFF;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() => pageView());
  }

  Widget pageView() {
    if (controller.selectedTab.value == 0) {
      return communityPage();
    } else {
      return Opacity(
        opacity: 0.5,
        child: communityPage(),
      );
    }
  }

  @override
  Widget? bottomNavigationBar() {
    return FABBottomAppBar(
      color: AppColor.dark202125,
      backgroundColor: AppColor.whiteLightestGrayF8F8F8,
      selectedColor: AppColor.primaryOne4B9EFF,
      height: 52,
      iconSize: 15,
      notchedShape: const CircularNotchedRectangle(),
      onTabSelected: (v) => controller.selectedTab.value = v,
      items: [
        FABBottomAppBarItem(svgIcon: Assets.svgComunityIcon, text: "Community"),
        FABBottomAppBarItem(svgIcon: Assets.svgLogoutIcons, text: "Logout"),
      ],
    );
  }

  Widget communityPage() => Column(
        children: [
          const SizedBox(height: 12),
          createPost(onPress: () async {
            await Get.toNamed(AppRoutes.CREATE_POST);
            await controller.onRefresh();
          }),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: PagingView<FeedItemResponse>(
                pagingController: controller.paginationController.pagingController,
                itemBuilder: (context, item, i) => NewsFeedItemCard(
                      item: item,
                      onPressComment: () async {
                        if (item.commentCount != null && item.commentCount! > 0) {
                          await controller.getCommentList(item.id ?? -999);
                          await Get.bottomSheet(CommentModal(
                            comments: controller.selectedCommentList.value,
                            commentController: controller.commentController,
                            onPressComment: () async{
                              await controller.createComment(feedId: item.id??-99, feedUserId: item.user?.id??-99);
                            },
                          ));
                        }
                      },
                    )),
          ))
        ],
      );

  Widget createPost({VoidCallback? onPress}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
              child: const Icon(
                Icons.person,
                color: Colors.grey,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                onTap: onPress,
                decoration: const InputDecoration(
                  hintText: 'Write Something here...',
                  border: InputBorder.none,
                ),
                readOnly: true,
              ),
            ),
            DefaultPrimaryButton(
              text: "Post",
              height: 40,
              onPressed: onPress,
              buttonRound: ButtonRound.minRounded,
            )
          ],
        ),
      );
}

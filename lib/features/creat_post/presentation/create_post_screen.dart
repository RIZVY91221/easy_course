import 'package:bs_assignment/core/base/base_view.dart';
import 'package:bs_assignment/core/enum.dart';
import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/uttils/functions.dart';
import 'package:bs_assignment/core/values/values.dart';
import 'package:bs_assignment/core/widget/global/button/app_button.dart';
import 'package:bs_assignment/core/widget/global/loading/wid_loading_skeleton.dart';
import 'package:bs_assignment/features/creat_post/controller/creat_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostScreen extends BaseView<CreatePostController>{
  CreatePostScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(()=>controller.pageState!=PageState.LOADING?Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.whiteLightestGrayF8F8F8,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColor.whiteLightGrayE4E5E6,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextPrimaryButton(child: AppText.bodySmall("Close",color: AppColor.darkLightest6C7576),onPressed: ()=>Get.back(),),
              AppText.bodyDefault("Create Post",color: AppColor.dark202125,),
              TextPrimaryButton(child: AppText.bodySmall("Create",color: Colors.blue),onPressed: ()async=>await controller.postContent(),),
            ],
          ),
          AppGap.vertical20,
          TextField(
            controller: controller.contentTextController,
            decoration: InputDecoration(
              hintText: "What's on your mind?",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color:AppColor.disabledE4E5E7)
              ),
              fillColor: AppColor.whiteFFFFFF,  // Set your desired background color here
              filled: true,
            ),
            maxLines: 4,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {},
              ),
              ... FN.gradientsColor.asMap().entries.map((entry) {
                int index = entry.key;
                var gradient = entry.value; // Getting the gradient value for the current index
                return InkWell(
                  onTap: (){
                    controller.selectedColorIndex.value=index;
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: controller.selectedColorIndex.value!=null&&controller.selectedColorIndex.value==index?AppColor.primaryOne4B9EFF:AppColor.transparent),
                        gradient: gradient, // Use the gradient value from the list
                      ),
                    ),
                  ),
                );
              }).toList()

            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    ):const WidgetLoadingSkeleton(
      pageState: PageState.LOADING,
      rows: 4,
    ),);
  }


  @override
  Color statusBarColor() {
    return AppColor.whiteLightestGrayF8F8F8;
  }
}
import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/uttils/functions.dart';
import 'package:bs_assignment/core/uttils/icons.dart';
import 'package:bs_assignment/core/values/values.dart';
import 'package:bs_assignment/core/widget/global/card/card.dart';
import 'package:bs_assignment/core/widget/global/divider/wid_divider.dart';
import 'package:bs_assignment/core/widget/global/image_view/wid_clickable_image_view.dart';
import 'package:bs_assignment/core/widget/global/text/wid_readmore_text.dart';
import 'package:bs_assignment/core/widget/user/gradient_container.dart';
import 'package:bs_assignment/core/widget/user/widget_reaction_view.dart';
import 'package:bs_assignment/generated/assets.dart';
import 'package:bs_assignment/models/community_posts/feed_response.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../dailog/wid_popup_menu_button.dart';


class NewsFeedItemCard extends StatelessWidget {
  const NewsFeedItemCard({Key? key, required this.item, this.onPressComment}) : super(key: key);
  final FeedItemResponse item;
  final VoidCallback? onPressComment;

  @override
  Widget build(BuildContext context) {
    return CardWrapperWidget(
      cardHeader: pickupOrderHeader(context),
      cardBody: pickupOrderCardBody(context),
    );
  }

  CardHeader pickupOrderHeader(BuildContext context) {
    return CardHeader(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 35,
                height: 35,
                child: WidgetClickableImageView(
                  image: item.user?.profilePic??"",
                  margin: EdgeInsets.zero,
                  backgroundColor: AppColor.transparent,
                  borderRadius: 30,
                  isText: false,
                  border: Border.all(color: AppColor.whiteLightestGrayF8F8F8),
                  // popView: true,
                ),
              ),
              AppGap.horizontal8,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.user?.fullName??'',style: AppTextStyle.bodySmall().copyWith(fontWeight: FontWeight.w600,color: AppColor.dark202125),),
                  Text(timeago.format(DateTime.parse("${item.createdAt}")),style: AppTextStyle.bodyExtraSmall().copyWith(color: const Color(0xff667085)),)
                ],
              ),

            ],
          ),
          SizedBox(
            height: 22,
            width: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Center(
                child: CustomPopupMenuButton(
                  padding: const EdgeInsets.only(right: 6),
                  items: const ["More Info"],
                  onSelect: (value) {},
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  CardBody pickupOrderCardBody(BuildContext context) {
    return CardBody(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppDivider(),
            AppGap.vertical(8),
           item.bgColor==null? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
              child: WidgetReadMoreText(text:item.feedTxt??"",trimLines: 4,textStyle: AppTextStyle.bodyVerySmall(color: AppColor.dark202125),),
            ):Container(
             width: double.infinity,
             height: MediaQuery.of(context).size.height / 4,
             decoration: BoxDecoration(
               shape: BoxShape.rectangle,
               borderRadius: BorderRadius.circular(7),
               gradient: FN.feedBackGroundGradientColors.contains(item.bgColor ?? "")
                   ? FN.gradientsColor[FN.feedBackGroundGradientColors.indexOf(item.bgColor ?? "")]
                   : FN.gradientsColor[0], // Fallback gradient if bgColor is not found
             ),
             child: Center(
               child: Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: AppText.bodyDefault(item.feedTxt ?? "", color: FN.feedBackGroundGradientColors.contains(item.bgColor ?? "")&&FN.feedBackGroundGradientColors.indexOf(item.bgColor ?? "")==0?AppColor.dark202125:AppColor.whiteFFFFFF),
               ),
             ),
           ),
            AppGap.vertical(8),
            item.fileType=="photos" && item.files!.isNotEmpty?SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/3,
              child: WidgetClickableImageView(
                image:item.files?[0].fileLoc??"",
                margin: EdgeInsets.zero,
                backgroundColor: AppColor.transparent,
                borderRadius: 10,
                isText: false,
                // popView: true,
              ),
            ):const SizedBox.shrink(),
            ReactionWidget(likes: item.likeType!.length,comments: item.commentCount??0,likeType: item.likeType??[],),
            AppGap.vertical15,
            WidgetSubmitReaction(onTabComment: onPressComment,)
          ],
        ));
  }
}

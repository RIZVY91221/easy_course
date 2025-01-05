import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/uttils/icons.dart';
import 'package:bs_assignment/generated/assets.dart';
import 'package:bs_assignment/models/community_posts/feed_response.dart';
import 'package:flutter/material.dart';

class ReactionWidget extends StatelessWidget {
  final int likes;
  final int comments;
  final List<LikeType> likeType;

  const ReactionWidget({
    Key? key,
    required this.likes,
    required this.comments,
    required this.likeType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Wrap(
                spacing: -4.0, // Overlap the icons slightly
                children: likeType.map((reaction) {
                  return itemIcon(reaction.reactionType ?? "");
                }).toList(),
              ),
            ),

            const SizedBox(width: 5),
            likes>0?AppText.bodyVerySmall(
              'You and $likes other',color: AppColor.dark202125
            ):const SizedBox.shrink()
          ],
        ),
        Row(
          children: [
            appSVG(Assets.svgCommentOutline,size: 14),
            const SizedBox(width: 4),
            AppText.bodyVerySmall(
                '$comments Comments',color: AppColor.dark202125
            )
          ],
        ),
      ],
    );
  }

  Widget itemIcon(String reactionType)=>appSVG(
    assetPath(reactionType),
    size: 17,
  );

  String assetPath(String reactionType){
    if(reactionType=="LIKE"){
      return Assets.svgLikeIcon;
    }else if(reactionType=="ANGRY"){
      return Assets.svgAngryIcon;
    }else if(reactionType=="HAHA"){
      return Assets.svgHahaIcon;
    }else if(reactionType=="CARE"){
      return Assets.svgCareIcon;
    }else if(reactionType=="WOW"){
      return Assets.svgWowIcon;
    }else if(reactionType=="SAD"){
      return Assets.svgSadIcon;
    }else{
      debugPrint("Unknown reaction type: $reactionType");
      return Assets.svgLikeIcon;
    }
  }
}

class WidgetSubmitReaction extends StatelessWidget {
  const WidgetSubmitReaction({super.key, this.onPressLike, this.onHoldPressLike, this.onTabComment});
  final VoidCallback? onPressLike;
  final VoidCallback? onHoldPressLike;
  final VoidCallback? onTabComment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onHoldPressLike,
          onLongPress: onHoldPressLike,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: appSVG(Assets.svgLikeIcon)
              ),

              const SizedBox(width: 5),
              AppText.bodySmall("Like",color: AppColor.dark202125)
            ],
          ),
        ),
        GestureDetector(
          onTap: onTabComment,
          child: Row(
            children: [
              appSVG(Assets.svgCommentBold,size: 15),
              const SizedBox(width: 4),
              AppText.bodySmall(
                  "Comment",color: AppColor.dark202125
              )
            ],
          ),
        ),
      ],
    );
  }
}


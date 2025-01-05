import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/widget/global/divider/wid_divider.dart';
import 'package:bs_assignment/core/widget/global/image_view/wid_clickable_image_view.dart';
import 'package:bs_assignment/models/community_posts/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:get/get.dart';

class CommentModal extends StatelessWidget {
  final List<CommunityComment> comments;
  final VoidCallback? onPressComment;
  final TextEditingController commentController;

  const CommentModal({
    Key? key,
    required this.comments,
    this.onPressComment,
    required this.commentController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.thumb_up_alt,
                      color: Colors.blue,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'You and 2 other',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                InkWell(onTap: ()=>Get.back(),child: const Icon(Icons.close),),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return _buildCommentTile(comments[index]);
              },
            ),
          ),
         const AppDivider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Write a Comment',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: onPressComment,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(Icons.send, color: Colors.yellowAccent),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentTile(CommunityComment comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[300],
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: WidgetClickableImageView(
                    image: comment.user?.profilePic??"",
                    margin: EdgeInsets.zero,
                    backgroundColor: AppColor.transparent,
                    borderRadius: 30,
                    isText: false,
                    border: Border.all(color: AppColor.whiteLightestGrayF8F8F8),
                    // popView: true,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.user?.fullName??"",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        comment.commentTxt??"",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timeago.format(DateTime.parse("${comment.createdAt}")),
                  style: TextStyle(fontSize: 12, color: AppColor.dark202125),
                ),
                const SizedBox(width: 12),
                Text(
                  'Like',
                  style: TextStyle(fontSize: 12, color: AppColor.primaryOne4B9EFF),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Reply',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const Spacer(),
                comment.likeCount!>0?const Icon(
                  Icons.thumb_up_alt,
                  color: Colors.blue,
                  size: 14,
                ):const SizedBox.shrink(),
                const SizedBox(width: 4),
                comment.likeCount!>0?Text(
                  "${comment.likeCount??""}",
                  style: const TextStyle(fontSize: 12),
                ):const SizedBox.shrink()
              ],
            ),
          ),
        ],
      ),
    );
  }
}


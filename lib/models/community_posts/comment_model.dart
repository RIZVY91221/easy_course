import 'package:bs_assignment/models/community_posts/feed_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CommunityComment {
  int? id;
  int? schoolId;
  int? feedId;
  int? userId;
  int? replyCount;
  int? likeCount;
  String? commentTxt;
  dynamic parrentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic file;
  dynamic privateUserId;
  int? isAuthorAndAnonymous;
  dynamic gift;
  dynamic sellerId;
  dynamic giftedCoins;
  List<dynamic>? replies;
  User? user;
  dynamic privateUser;
  List<dynamic>? reactionTypes;
  List<dynamic>? totalLikes;
  dynamic commentlike;

  CommunityComment({
    this.id,
    this.schoolId,
    this.feedId,
    this.userId,
    this.replyCount,
    this.likeCount,
    this.commentTxt,
    this.parrentId,
    this.createdAt,
    this.updatedAt,
    this.file,
    this.privateUserId,
    this.isAuthorAndAnonymous,
    this.gift,
    this.sellerId,
    this.giftedCoins,
    this.replies,
    this.user,
    this.privateUser,
    this.reactionTypes,
    this.totalLikes,
    this.commentlike,
  });

  factory CommunityComment.fromJson(Map<String, dynamic> json) => _$CommunityCommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommunityCommentToJson(this);

}
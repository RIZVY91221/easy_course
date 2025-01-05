// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityComment _$CommunityCommentFromJson(Map<String, dynamic> json) =>
    CommunityComment(
      id: (json['id'] as num?)?.toInt(),
      schoolId: (json['school_id'] as num?)?.toInt(),
      feedId: (json['feed_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      replyCount: (json['reply_count'] as num?)?.toInt(),
      likeCount: (json['like_count'] as num?)?.toInt(),
      commentTxt: json['comment_txt'] as String?,
      parrentId: json['parrent_id'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      file: json['file'],
      privateUserId: json['private_user_id'],
      isAuthorAndAnonymous: (json['is_author_and_anonymous'] as num?)?.toInt(),
      gift: json['gift'],
      sellerId: json['seller_id'],
      giftedCoins: json['gifted_coins'],
      replies: json['replies'] as List<dynamic>?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      privateUser: json['private_user'],
      reactionTypes: json['reaction_types'] as List<dynamic>?,
      totalLikes: json['total_likes'] as List<dynamic>?,
      commentlike: json['commentlike'],
    );

Map<String, dynamic> _$CommunityCommentToJson(CommunityComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_id': instance.schoolId,
      'feed_id': instance.feedId,
      'user_id': instance.userId,
      'reply_count': instance.replyCount,
      'like_count': instance.likeCount,
      'comment_txt': instance.commentTxt,
      'parrent_id': instance.parrentId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'file': instance.file,
      'private_user_id': instance.privateUserId,
      'is_author_and_anonymous': instance.isAuthorAndAnonymous,
      'gift': instance.gift,
      'seller_id': instance.sellerId,
      'gifted_coins': instance.giftedCoins,
      'replies': instance.replies,
      'user': instance.user,
      'private_user': instance.privateUser,
      'reaction_types': instance.reactionTypes,
      'total_likes': instance.totalLikes,
      'commentlike': instance.commentlike,
    };

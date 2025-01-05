// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedItemResponse _$FeedItemResponseFromJson(Map<String, dynamic> json) =>
    FeedItemResponse(
      id: (json['id'] as num?)?.toInt(),
      schoolId: (json['school_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      courseId: json['course_id'],
      communityId: (json['community_id'] as num?)?.toInt(),
      groupId: json['group_id'],
      feedTxt: json['feed_txt'] as String?,
      status: json['status'] as String?,
      slug: json['slug'] as String?,
      title: json['title'] as String?,
      activityType: json['activity_type'],
      isPinned: (json['is_pinned'] as num?)?.toInt(),
      fileType: json['file_type'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => FileElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      likeCount: (json['like_count'] as num?)?.toInt(),
      commentCount: (json['comment_count'] as num?)?.toInt(),
      shareCount: (json['share_count'] as num?)?.toInt(),
      shareId: (json['share_id'] as num?)?.toInt(),
      metaData: json['meta_data'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      feedPrivacy: json['feed_privacy'] as String?,
      isBackground: (json['is_background'] as num?)?.toInt(),
      bgColor: json['bg_color'] as String?,
      pollId: json['poll_id'],
      lessonId: json['lesson_id'],
      spaceId: (json['space_id'] as num?)?.toInt(),
      videoId: json['video_id'],
      streamId: json['stream_id'],
      blogId: json['blog_id'],
      scheduleDate: json['schedule_date'],
      timezone: json['timezone'] as String?,
      isAnonymous: (json['is_anonymous'] as num?)?.toInt(),
      meetingId: json['meeting_id'],
      sellerId: json['seller_id'],
      publishDate: json['publish_date'] == null
          ? null
          : DateTime.parse(json['publish_date'] as String),
      isFeedEdit: json['is_feed_edit'] as bool?,
      name: json['name'],
      pic: json['pic'] as String?,
      uid: (json['uid'] as num?)?.toInt(),
      isPrivateChat: (json['is_private_chat'] as num?)?.toInt(),
      group: json['group'],
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      like: json['like'],
      poll: json['poll'],
      likeType: (json['likeType'] as List<dynamic>?)
          ?.map((e) => LikeType.fromJson(e as Map<String, dynamic>))
          .toList(),
      savedPosts: json['saved_posts'],
      follow: json['follow'],
      comments: json['comments'] as List<dynamic>?,
      meta: json['meta'] == null
          ? null
          : PurpleMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedItemResponseToJson(FeedItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_id': instance.schoolId,
      'user_id': instance.userId,
      'course_id': instance.courseId,
      'community_id': instance.communityId,
      'group_id': instance.groupId,
      'feed_txt': instance.feedTxt,
      'status': instance.status,
      'slug': instance.slug,
      'title': instance.title,
      'activity_type': instance.activityType,
      'is_pinned': instance.isPinned,
      'file_type': instance.fileType,
      'files': instance.files,
      'like_count': instance.likeCount,
      'comment_count': instance.commentCount,
      'share_count': instance.shareCount,
      'share_id': instance.shareId,
      'meta_data': instance.metaData,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'feed_privacy': instance.feedPrivacy,
      'is_background': instance.isBackground,
      'bg_color': instance.bgColor,
      'poll_id': instance.pollId,
      'lesson_id': instance.lessonId,
      'space_id': instance.spaceId,
      'video_id': instance.videoId,
      'stream_id': instance.streamId,
      'blog_id': instance.blogId,
      'schedule_date': instance.scheduleDate,
      'timezone': instance.timezone,
      'is_anonymous': instance.isAnonymous,
      'meeting_id': instance.meetingId,
      'seller_id': instance.sellerId,
      'publish_date': instance.publishDate?.toIso8601String(),
      'is_feed_edit': instance.isFeedEdit,
      'name': instance.name,
      'pic': instance.pic,
      'uid': instance.uid,
      'is_private_chat': instance.isPrivateChat,
      'group': instance.group,
      'user': instance.user,
      'like': instance.like,
      'poll': instance.poll,
      'likeType': instance.likeType,
      'saved_posts': instance.savedPosts,
      'follow': instance.follow,
      'comments': instance.comments,
      'meta': instance.meta,
    };

FileElement _$FileElementFromJson(Map<String, dynamic> json) => FileElement(
      fileLoc: json['fileLoc'] as String?,
      originalName: json['originalName'] as String?,
      extname: json['extname'] as String?,
      type: json['type'],
      size: (json['size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FileElementToJson(FileElement instance) =>
    <String, dynamic>{
      'fileLoc': instance.fileLoc,
      'originalName': instance.originalName,
      'extname': instance.extname,
      'type': instance.type,
      'size': instance.size,
    };

LikeType _$LikeTypeFromJson(Map<String, dynamic> json) => LikeType(
      reactionType: json['reaction_type'] as String?,
      feedId: (json['feed_id'] as num?)?.toInt(),
      meta: json['meta'],
    );

Map<String, dynamic> _$LikeTypeToJson(LikeType instance) => <String, dynamic>{
      'reaction_type': instance.reactionType,
      'feed_id': instance.feedId,
      'meta': instance.meta,
    };

PurpleMeta _$PurpleMetaFromJson(Map<String, dynamic> json) => PurpleMeta(
      views: (json['views'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PurpleMetaToJson(PurpleMeta instance) =>
    <String, dynamic>{
      'views': instance.views,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name'],
      profilePic: json['profile_pic'] as String?,
      isPrivateChat: (json['is_private_chat'] as num?)?.toInt(),
      expireDate: json['expire_date'],
      status: json['status'],
      pauseDate: json['pause_date'],
      userType: json['user_type'] as String?,
      meta: json['meta'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'profile_pic': instance.profilePic,
      'is_private_chat': instance.isPrivateChat,
      'expire_date': instance.expireDate,
      'status': instance.status,
      'pause_date': instance.pauseDate,
      'user_type': instance.userType,
      'meta': instance.meta,
    };

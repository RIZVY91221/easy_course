
import 'package:json_annotation/json_annotation.dart';

part 'feed_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FeedItemResponse {
  int? id;
  int? schoolId;
  int? userId;
  dynamic courseId;
  int? communityId;
  dynamic groupId;
  String? feedTxt;
  String? status;
  String? slug;
  String? title;
  dynamic activityType;
  int? isPinned;
  String? fileType;
  List<FileElement>? files;
  int? likeCount;
  int? commentCount;
  int? shareCount;
  int? shareId;
  dynamic metaData;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? feedPrivacy;
  int? isBackground;
  String? bgColor;
  dynamic pollId;
  dynamic lessonId;
  int? spaceId;
  dynamic videoId;
  dynamic streamId;
  dynamic blogId;
  dynamic scheduleDate;
  String? timezone;
  int? isAnonymous;
  dynamic meetingId;
  dynamic sellerId;
  DateTime? publishDate;
  bool? isFeedEdit;
  dynamic name;
  String? pic;
  int? uid;
  int? isPrivateChat;
  dynamic group;
  User? user;
  dynamic like;
  dynamic poll;
  @JsonKey(name: 'likeType')
  List<LikeType>? likeType;
  dynamic savedPosts;
  dynamic follow;
  List<dynamic>? comments;
  PurpleMeta? meta;

  FeedItemResponse({
    this.id,
    this.schoolId,
    this.userId,
    this.courseId,
    this.communityId,
    this.groupId,
    this.feedTxt,
    this.status,
    this.slug,
    this.title,
    this.activityType,
    this.isPinned,
    this.fileType,
    this.files,
    this.likeCount,
    this.commentCount,
    this.shareCount,
    this.shareId,
    this.metaData,
    this.createdAt,
    this.updatedAt,
    this.feedPrivacy,
    this.isBackground,
    this.bgColor,
    this.pollId,
    this.lessonId,
    this.spaceId,
    this.videoId,
    this.streamId,
    this.blogId,
    this.scheduleDate,
    this.timezone,
    this.isAnonymous,
    this.meetingId,
    this.sellerId,
    this.publishDate,
    this.isFeedEdit,
    this.name,
    this.pic,
    this.uid,
    this.isPrivateChat,
    this.group,
    this.user,
    this.like,
    this.poll,
    this.likeType,
    this.savedPosts,
    this.follow,
    this.comments,
    this.meta,
  });

  factory FeedItemResponse.fromJson(Map<String, dynamic> json) => _$FeedItemResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FeedItemResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class FileElement {
  @JsonKey(name: 'fileLoc')
  String? fileLoc;
  @JsonKey(name: 'originalName')
  String? originalName;
  String? extname;
  dynamic type;
  int? size;

  FileElement({
    this.fileLoc,
    this.originalName,
    this.extname,
    this.type,
    this.size,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => _$FileElementFromJson(json);
  Map<String, dynamic> toJson() => _$FileElementToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class LikeType {
  String? reactionType;
  int? feedId;
  dynamic meta;

  LikeType({
    this.reactionType,
    this.feedId,
    this.meta,
  });
  factory LikeType.fromJson(Map<String, dynamic> json) => _$LikeTypeFromJson(json);
  Map<String, dynamic> toJson() => _$LikeTypeToJson(this);
}


@JsonSerializable(fieldRename: FieldRename.snake)
class PurpleMeta {
  int? views;

  PurpleMeta({
    this.views,
  });

  factory PurpleMeta.fromJson(Map<String, dynamic> json) => _$PurpleMetaFromJson(json);
  Map<String, dynamic> toJson() => _$PurpleMetaToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  int? id;
  dynamic fullName;
  String? profilePic;
  int? isPrivateChat;
  dynamic expireDate;
  dynamic status;
  dynamic pauseDate;
  String? userType;
  dynamic meta;

  User({
    this.id,
    this.fullName,
    this.profilePic,
    this.isPrivateChat,
    this.expireDate,
    this.status,
    this.pauseDate,
    this.userType,
    this.meta,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

import 'package:bs_assignment/environment/build_config.dart';

class Endpoints {
  Endpoints._();

  // base url
  static var baseUrl = BuildConfig.instance.envVariables.baseUrl;

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const int sendTimeout = 10000;

  static const String source = "";

  //TODO: Add other settings and url endpoint here

  static const String POST_LOGIN = "/student/auth/login";
  static const String POST_LOGOUT = "/student/auth/logout";
  static const String NEWS_FEED = "/teacher/community/getFeed";
  static const String CREATE_POST = "/teacher/community/createFeedWithUpload";
  static const String GET_COMMENT = "/student/comment/getComment";
  static const String CREATE_COMMENT = "/student/comment/createComment";
}

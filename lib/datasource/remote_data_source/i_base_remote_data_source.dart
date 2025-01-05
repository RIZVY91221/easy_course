import 'package:bs_assignment/core/network/dio_client.dart';
import 'package:bs_assignment/core/network/rest_client.dart';
import 'package:bs_assignment/core/utils/endpoints/endpoints.dart';
import 'package:bs_assignment/datasource/remote_data_source/base_remote_data_source.dart';
import 'package:bs_assignment/models/auth/login_response.dart';
import 'package:bs_assignment/models/community_posts/comment_model.dart';
import 'package:bs_assignment/models/community_posts/feed_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ImplementBaseRemoteDataSource extends BaseRemoteDataSource {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  ImplementBaseRemoteDataSource(this._dioClient, this._restClient);

  @override
  Future<LoginResponse> postLogin(String email, String password) async {
    Map<String, dynamic> body = {};
    body["email"] = email;
    body["password"] = password;
    body["app_token"] = " ";
    try {
      final res = await _dioClient.post(Endpoints.POST_LOGIN, queryParameters: body);
      return LoginResponse.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  ///teacher/community/getFeed?status=feed&page=1
///
  @override
  Future<List<FeedItemResponse>> getCommunityFeedResponse(String page) async {
    try {
      final res = await _dioClient.post(Endpoints.NEWS_FEED,queryParameters: {"status":"feed"},
        data: {"community_id":"2914","space_id":"5883","more":page}
      );
      return List<FeedItemResponse>.from(res.map((e) => FeedItemResponse.fromJson(e)).toList());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> createPost(Map<String, dynamic> task) async{
    try {
      final res = await _dioClient.post(Endpoints.CREATE_POST, data: task);

      return await res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> postLogout() async{
    try {
      final res = await _dioClient.post(Endpoints.POST_LOGOUT);

      return await res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CommunityComment>> getComment(int id) async{
    try {
      final res = await _dioClient.get("${Endpoints.GET_COMMENT}/$id");

      return List<CommunityComment>.from(res.map((e) => CommunityComment.fromJson(e)).toList());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> createComment(Map<String, dynamic> task) async{
    try {
      final res = await _dioClient.post(Endpoints.CREATE_COMMENT, data: task);

      return await res;
    } catch (e) {
      rethrow;
    }
  }
}

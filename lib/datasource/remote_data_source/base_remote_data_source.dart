import 'package:bs_assignment/core/network/dio_client.dart';
import 'package:bs_assignment/core/network/rest_client.dart';
import 'package:bs_assignment/datasource/remote_data_source/i_base_remote_data_source.dart';
import 'package:bs_assignment/models/auth/login_response.dart';
import 'package:bs_assignment/models/community_posts/comment_model.dart';
import 'package:bs_assignment/models/community_posts/feed_response.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class BaseRemoteDataSource {
  @factoryMethod
  static ImplementBaseRemoteDataSource create(DioClient dioClient, RestClient restClient) =>
      ImplementBaseRemoteDataSource(dioClient, restClient);

  Future<LoginResponse> postLogin(String email, String password);
  Future<void> postLogout();
  Future<List<FeedItemResponse>> getCommunityFeedResponse(String page);
  Future<Map<String,dynamic>> createPost(Map<String,dynamic> task);

  Future<List<CommunityComment>> getComment(int id);
  Future<Map<String, dynamic>> createComment(Map<String, dynamic> task);
}

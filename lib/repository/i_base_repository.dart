import 'package:bs_assignment/datasource/local_data_source/base_local_source.dart';
import 'package:bs_assignment/datasource/remote_data_source/base_remote_data_source.dart';
import 'package:bs_assignment/datasource/shared_preference_data_source/base_shared_prefrence.dart';
import 'package:bs_assignment/models/auth/login_response.dart';
import 'package:bs_assignment/models/product/product_resource.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ImplementBaseRepository implements BaseRepository {
  // api objects
  final BaseRemoteDataSource _remoteDataSource;

  final BaseLocalDataSource _localDataSource;

  final BaseSharedPreference _sharedPreference;

  // constructor
  ImplementBaseRepository(this._remoteDataSource, this._localDataSource, this._sharedPreference);

  @override
  Future initBoxes(List<String> boxes) {
    return _localDataSource.initBoxes(boxes);
  }

  @override
  String get accessToken => _localDataSource.accessToken;

  @override
  Future<void> setAccessToken(String accessToken) {
    return _localDataSource.setAccessToken(accessToken);
  }

  @override
  Future<LoginResponse> postLogin(String email, String password) async {
    return await _remoteDataSource.postLogin(email, password).catchError((onError) => throw onError);
  }

  @override
  Future<Map<String, dynamic>> postSignup(Map<String, dynamic> data) async {
    return await _remoteDataSource.postSignup(data);
  }

  @override
  Future<List<ProductResource>> getProductList(String filterBy) async {
    return await _remoteDataSource.getProductList(filterBy);
  }

  @override
  Future<void> logout() {
    return _localDataSource.logout();
  }

  @override
  String get currentUserId => _localDataSource.currentUserId;

  @override
  Future<void> setCurrentUserId(String userId) async {
    return await _localDataSource.setCurrentUserId(userId);
  }

  @override
  Future<void> setUserDefault(LoginResponse userDefault) async {
    return await _localDataSource.setUserDefault(userDefault);
  }

  @override
  LoginResponse get userDefault => _localDataSource.userDefault;

  @override
  Future<Map<String, dynamic>> getUserDetails() async {
    return await _remoteDataSource.getUserDetails();
  }

  @override
  Future<Map<String, dynamic>> updateUser(String id, Map<String, dynamic> data) async {
    return await _remoteDataSource.updateUser(id, data);
  }
}

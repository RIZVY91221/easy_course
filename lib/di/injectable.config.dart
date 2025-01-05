// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bs_assignment/core/network/dio_client.dart' as _i226;
import 'package:bs_assignment/core/network/rest_client.dart' as _i651;
import 'package:bs_assignment/datasource/local_data_source/base_local_source.dart'
    as _i590;
import 'package:bs_assignment/datasource/local_data_source/i_base_local_data_source.dart'
    as _i253;
import 'package:bs_assignment/datasource/remote_data_source/base_remote_data_source.dart'
    as _i432;
import 'package:bs_assignment/datasource/remote_data_source/i_base_remote_data_source.dart'
    as _i354;
import 'package:bs_assignment/datasource/shared_preference_data_source/base_shared_prefrence.dart'
    as _i840;
import 'package:bs_assignment/datasource/shared_preference_data_source/i_base_shared_prefrence.dart'
    as _i199;
import 'package:bs_assignment/di/%20module/app_module.dart' as _i282;
import 'package:bs_assignment/di/%20module/network_module.dart' as _i114;
import 'package:bs_assignment/di/%20module/preference_module.dart' as _i325;
import 'package:bs_assignment/repository/base_repository.dart' as _i299;
import 'package:bs_assignment/repository/i_base_repository.dart' as _i288;
import 'package:dio/dio.dart' as _i361;
import 'package:get/get.dart' as _i747;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final preferenceModule = _$PreferenceModule();
    final networkModule = _$NetworkModule();
    final app = _$App();
    gh.factory<_i590.BaseLocalDataSource>(
        () => _i590.BaseLocalDataSource.from());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => preferenceModule.prefs,
      preResolve: true,
    );
    gh.factory<String>(() => networkModule.TAG);
    gh.singleton<_i253.ImplementBaseLocalDataSource>(
        () => _i253.ImplementBaseLocalDataSource());
    gh.lazySingleton<_i651.RestClient>(() => _i651.RestClient());
    gh.singleton<_i199.ImplementBaseSharedPreference>(() =>
        _i199.ImplementBaseSharedPreference(gh<_i460.SharedPreferences>()));
    gh.factory<_i840.BaseSharedPreference>(
        () => _i840.BaseSharedPreference.create(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i747.GetMaterialApp>(
        () => app.provideGetMaterialApp(gh<_i590.BaseLocalDataSource>()));
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio(
          gh<_i840.BaseSharedPreference>(),
          gh<_i590.BaseLocalDataSource>(),
        ));
    gh.lazySingleton<_i226.DioClient>(() => _i226.DioClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i354.ImplementBaseRemoteDataSource>(
        () => _i354.ImplementBaseRemoteDataSource(
              gh<_i226.DioClient>(),
              gh<_i651.RestClient>(),
            ));
    gh.factory<_i432.BaseRemoteDataSource>(
        () => _i432.BaseRemoteDataSource.create(
              gh<_i226.DioClient>(),
              gh<_i651.RestClient>(),
            ));
    gh.factory<_i299.BaseRepository>(() => _i299.BaseRepository.create(
          gh<_i432.BaseRemoteDataSource>(),
          gh<_i590.BaseLocalDataSource>(),
          gh<_i840.BaseSharedPreference>(),
        ));
    gh.lazySingleton<_i288.ImplementBaseRepository>(
        () => _i288.ImplementBaseRepository(
              gh<_i432.BaseRemoteDataSource>(),
              gh<_i590.BaseLocalDataSource>(),
              gh<_i840.BaseSharedPreference>(),
            ));
    return this;
  }
}

class _$PreferenceModule extends _i325.PreferenceModule {}

class _$NetworkModule extends _i114.NetworkModule {}

class _$App extends _i282.App {}

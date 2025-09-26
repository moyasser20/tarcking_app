// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/api/api_client/apply_api_client.dart' as _i901;
import '../../features/auth/api/data_source_impl/auth_remote_data_source_impl.dart'
    as _i758;
import '../../features/auth/data/datasource/auth_remote_data_source.dart'
    as _i24;
import '../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i279;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/use_cases/apply_driver_usecase.dart'
    as _i159;
import '../../features/auth/presentation/view_model/apply_cubit.dart' as _i488;
import '../api/client/api_client.dart' as _i364;
import 'dio_module/dio_module.dart' as _i484;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<String>(() => dioModule.baseUrl, instanceName: 'baseurl');
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(gh<String>(instanceName: 'baseurl')),
    );
    gh.lazySingleton<_i901.ApplyApiClient>(
      () => _i901.ApplyApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i364.ApiClient>(
      () => _i364.ApiClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseurl'),
      ),
    );
    gh.lazySingleton<_i24.AuthRemoteDataSource>(
      () => _i758.AuthRemoteDataSourceImpl(gh<_i901.ApplyApiClient>()),
    );
    gh.lazySingleton<_i170.AuthRepo>(
      () => _i279.AuthRepoImpl(gh<_i24.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i159.ApplyDriverUseCase>(
      () => _i159.ApplyDriverUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i488.ApplyCubit>(
      () => _i488.ApplyCubit(gh<_i159.ApplyDriverUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i484.DioModule {}

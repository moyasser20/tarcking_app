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

import '../../features/apply/api/api_client/apply_api_client.dart' as _i1056;
import '../../features/apply/api/data_source_impl/apply_remote_data_source_impl.dart'
    as _i707;
import '../../features/apply/data/data_source/apply_remote_data_source.dart'
    as _i663;
import '../../features/apply/data/repo_impl/apply_repository_impl.dart'
    as _i158;
import '../../features/apply/domain/repo/apply_repository.dart' as _i787;
import '../../features/apply/domain/use_cases/apply_driver_usecase.dart'
    as _i596;
import '../../features/apply/presentation/view_model/apply_cubit.dart' as _i142;
import '../../features/auth/api/data_source_impl/auth_remote_data_source_impl.dart'
    as _i758;
import '../../features/auth/data/datasource/auth_remote_data_source.dart'
    as _i24;
import '../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i279;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
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
    gh.factory<_i170.AuthRepo>(() => _i279.AuthRepoImpl());
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(gh<String>(instanceName: 'baseurl')),
    );
    gh.lazySingleton<_i1056.ApplyApiClient>(
      () => _i1056.ApplyApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i364.ApiClient>(
      () => _i364.ApiClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseurl'),
      ),
    );
    gh.lazySingleton<_i24.AuthRemoteDataSource>(
      () => _i758.AuthRemoteDataSourceImpl(gh<_i364.ApiClient>()),
    );
    gh.lazySingleton<_i663.ApplyRemoteDataSource>(
      () => _i707.ApplyRemoteDataSourceImpl(gh<_i1056.ApplyApiClient>()),
    );
    gh.lazySingleton<_i787.ApplyRepository>(
      () => _i158.ApplyRepositoryImpl(gh<_i663.ApplyRemoteDataSource>()),
    );
    gh.lazySingleton<_i596.ApplyDriverUseCase>(
      () => _i596.ApplyDriverUseCase(gh<_i787.ApplyRepository>()),
    );
    gh.factory<_i142.ApplyCubit>(
      () => _i142.ApplyCubit(gh<_i596.ApplyDriverUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i484.DioModule {}

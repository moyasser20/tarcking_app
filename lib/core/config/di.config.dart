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

import '../../features/auth/api/data_source_impl/auth_remote_data_source_impl.dart'
    as _i758;
import '../../features/auth/data/datasource/auth_remote_data_source.dart'
    as _i24;
import '../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i279;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/usecases/login_usecase/login_usecase.dart'
    as _i517;
import '../../features/auth/presentation/login/cubit/login_cubit.dart' as _i179;
import '../../features/homescreen/api/data_sources_impl/home_remote_datasource_impl.dart'
    as _i730;
import '../../features/homescreen/data/data_sources/home_remote_datasource.dart'
    as _i1063;
import '../../features/homescreen/data/repositories/home_repo_impl.dart'
    as _i89;
import '../../features/homescreen/domain/repositories/home_repo.dart' as _i594;
import '../../features/homescreen/domain/use_cases/get_order_usecase.dart'
    as _i234;
import '../../features/homescreen/presentation/viewmodel/home_cubit.dart'
    as _i39;
import '../api/client/api_client.dart' as _i364;
import 'dio_module/dio_module.dart' as _i484;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.factory<String>(
      () => dioModule.baseUrl,
      instanceName: 'baseurl',
    );
    gh.lazySingleton<_i361.Dio>(
        () => dioModule.dio(gh<String>(instanceName: 'baseurl')));
    gh.factory<_i364.ApiClient>(() => _i364.ApiClient(
          gh<_i361.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseurl'),
        ));
    gh.lazySingleton<_i24.AuthRemoteDataSource>(
        () => _i758.AuthRemoteDataSourceImpl(gh<_i364.ApiClient>()));
    gh.factory<_i170.AuthRepo>(
        () => _i279.AuthRepoImpl(gh<_i24.AuthRemoteDataSource>()));
    gh.lazySingleton<_i1063.HomeRemoteDataSource>(
        () => _i730.HomeRemoteDataSourceImpl(gh<_i364.ApiClient>()));
    gh.factory<_i517.LoginUsecase>(
        () => _i517.LoginUsecase(gh<_i170.AuthRepo>()));
    gh.lazySingleton<_i594.HomeRepo>(
        () => _i89.HomeRepoImpl(gh<_i1063.HomeRemoteDataSource>()));
    gh.factory<_i179.LoginCubit>(
        () => _i179.LoginCubit(loginUsecase: gh<_i517.LoginUsecase>()));
    gh.factory<_i234.GetOrderUseCase>(
        () => _i234.GetOrderUseCase(gh<_i594.HomeRepo>()));
    gh.factory<_i39.HomeCubit>(
        () => _i39.HomeCubit(gh<_i234.GetOrderUseCase>()));
    return this;
  }
}

class _$DioModule extends _i484.DioModule {}

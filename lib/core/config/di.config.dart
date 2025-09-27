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
import '../../features/auth/data/datasource/auth_remote_datasource.dart'
    as _i175;
import '../../features/auth/data/repositories_implementation/auth_repo_impl.dart'
    as _i303;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/use_cases/apply_driver_usecase.dart'
    as _i159;
import '../../features/auth/domain/usecases/forget_password_usecase.dart'
    as _i948;
import '../../features/auth/domain/usecases/login_usecase/login_usecase.dart'
    as _i517;
import '../../features/auth/domain/usecases/reset_password_usecase.dart'
    as _i474;
import '../../features/auth/domain/usecases/verify_code_usecase.dart' as _i294;
import '../../features/auth/forget_password/presentation/viewmodel/forget_password_viewmodel.dart'
    as _i164;
import '../../features/auth/forget_password/presentation/viewmodel/reset_password_viewmodel.dart'
    as _i341;
import '../../features/auth/forget_password/presentation/viewmodel/verify_code_viewmodel.dart'
    as _i215;
import '../../features/auth/presentation/login/cubit/login_cubit.dart' as _i179;
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
    gh.factory<_i341.ResetPasswordCubit>(
      () => _i341.ResetPasswordCubit(gh<_i364.ApiClient>()),
    );
    gh.lazySingleton<_i175.AuthRemoteDatasource>(
      () => _i758.AuthRemoteDatasourceImpl(
        gh<_i364.ApiClient>(),
        gh<_i901.ApplyApiClient>(),
      ),
    );
    gh.factory<_i723.AuthRepo>(
      () => _i303.AuthRepoImpl(gh<_i175.AuthRemoteDatasource>()),
    );
    gh.factory<_i517.LoginUsecase>(
      () => _i517.LoginUsecase(gh<_i723.AuthRepo>()),
    );
    gh.lazySingleton<_i159.ApplyDriverUseCase>(
      () => _i159.ApplyDriverUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i488.ApplyCubit>(
      () => _i488.ApplyCubit(gh<_i159.ApplyDriverUseCase>()),
    );
    gh.factory<_i948.ForgetPasswordUseCase>(
      () => _i948.ForgetPasswordUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i474.ResetPasswordUseCase>(
      () => _i474.ResetPasswordUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i294.VerifyCodeUseCase>(
      () => _i294.VerifyCodeUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i179.LoginCubit>(
      () => _i179.LoginCubit(loginUsecase: gh<_i517.LoginUsecase>()),
    );
    gh.factory<_i215.VerifyCodeCubit>(
      () => _i215.VerifyCodeCubit(
        gh<_i294.VerifyCodeUseCase>(),
        gh<_i948.ForgetPasswordUseCase>(),
      ),
    );
    gh.factory<_i164.ForgetPasswordCubit>(
      () => _i164.ForgetPasswordCubit(gh<_i948.ForgetPasswordUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i484.DioModule {}

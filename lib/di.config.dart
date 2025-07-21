// dart format width=80
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

import 'api/dataSource/forget_password/email_verification_data_source_impl.dart'
    as _i921;
import 'api/dataSource/forget_password/forgetPasswordDataSourceImpl.dart'
    as _i476;
import 'api/dataSource/forget_password/reset_password_data_source_impl.dart'
    as _i510;
import 'api/network/api_service.dart' as _i386;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i386.ApiService>(
      () => _i386.ApiService(gh<_i361.Dio>(), baseUrl: gh<String>()),
    );
    gh.factory<_i921.EmailVerificationRemoteDataSourceImpl>(
      () => _i921.EmailVerificationRemoteDataSourceImpl(
        apiService: gh<_i386.ApiService>(),
      ),
    );
    gh.factory<_i476.ForgetPasswordEmailRemoteDataSourceImpl>(
      () => _i476.ForgetPasswordEmailRemoteDataSourceImpl(
        apiService: gh<_i386.ApiService>(),
      ),
    );
    gh.factory<_i510.ResetPasswordRemoteDataSourceImpl>(
      () => _i510.ResetPasswordRemoteDataSourceImpl(
        apiService: gh<_i386.ApiService>(),
      ),
    );
    return this;
  }
}

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
import 'features/forget_password/data/data_sources/email_verification_remote_data_source.dart'
    as _i924;
import 'features/forget_password/data/data_sources/forgot_password_remote_data_source.dart'
    as _i195;
import 'features/forget_password/data/data_sources/reset_password_remote_data_source.dart'
    as _i563;
import 'features/forget_password/data/repositories/email_verification_repository_impl.dart'
    as _i616;
import 'features/forget_password/data/repositories/forgot_password_repository_impl.dart'
    as _i642;
import 'features/forget_password/data/repositories/reset_passsword_repository_impl.dart'
    as _i70;
import 'features/forget_password/domain/repositories/email_verification_repository.dart'
    as _i522;
import 'features/forget_password/domain/repositories/forgot_password_repository.dart'
    as _i219;
import 'features/forget_password/domain/repositories/reset_password_repository.dart'
    as _i240;
import 'features/forget_password/domain/usecases/reset_password_usecase.dart'
    as _i614;
import 'features/forget_password/domain/usecases/send_email_verification_use_case.dart'
    as _i511;
import 'features/forget_password/domain/usecases/verifiy_code_use_case.dart'
    as _i378;

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
    gh.factory<_i195.ForgetPasswordEmailRemoteDataSource>(
      () => _i476.ForgetPasswordEmailRemoteDataSourceImpl(
        apiService: gh<_i386.ApiService>(),
      ),
    );
    gh.factory<_i563.ResetPasswordRemoteDataSource>(
      () => _i510.ResetPasswordRemoteDataSourceImpl(
        apiService: gh<_i386.ApiService>(),
      ),
    );
    gh.factory<_i219.ForgetPasswordEmailRepository>(
      () => _i642.ForgetPasswordEmailRepositoryImpl(
        forgetPasswordEmailRemoteDataSource:
            gh<_i195.ForgetPasswordEmailRemoteDataSource>(),
      ),
    );
    gh.factory<_i511.SendEmailVerificationUseCase>(
      () => _i511.SendEmailVerificationUseCase(
        gh<_i219.ForgetPasswordEmailRepository>(),
      ),
    );
    gh.factory<_i240.ResetPasswordRepository>(
      () => _i70.ResetPasswordRepositoryImpl(
        resetPasswordRemoteDataSource:
            gh<_i563.ResetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i924.EmailVerificationRemoteDataSource>(
      () => _i921.EmailVerificationRemoteDataSourceImpl(
        apiService: gh<_i386.ApiService>(),
      ),
    );
    gh.factory<_i614.ResetPasswordUseCase>(
      () => _i614.ResetPasswordUseCase(gh<_i240.ResetPasswordRepository>()),
    );
    gh.factory<_i522.EmailVerificationRepository>(
      () => _i616.EmailVerificationRepositoryImpl(
        emailVerificationRemoteDataSource:
            gh<_i924.EmailVerificationRemoteDataSource>(),
      ),
    );
    gh.factory<_i378.VerifyEmailUseCase>(
      () => _i378.VerifyEmailUseCase(gh<_i522.EmailVerificationRepository>()),
    );
    return this;
  }
}

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

import '../../api/dataSource/forget_password/email_verification_data_source_impl.dart'
    as _i351;
import '../../api/dataSource/forget_password/forgetPasswordDataSourceImpl.dart'
    as _i326;
import '../../api/dataSource/forget_password/reset_password_data_source_impl.dart'
    as _i106;
import '../../api/network/api_service.dart' as _i505;
import '../../features/Auth/forget_password/data/data_sources/email_verification_remote_data_source.dart'
    as _i1027;
import '../../features/Auth/forget_password/data/data_sources/forgot_password_remote_data_source.dart'
    as _i974;
import '../../features/Auth/forget_password/data/data_sources/reset_password_remote_data_source.dart'
    as _i56;
import '../../features/Auth/forget_password/data/repositories/email_verification_repository_impl.dart'
    as _i501;
import '../../features/Auth/forget_password/data/repositories/forgot_password_repository_impl.dart'
    as _i360;
import '../../features/Auth/forget_password/data/repositories/reset_passsword_repository_impl.dart'
    as _i776;
import '../../features/Auth/forget_password/domain/repositories/email_verification_repository.dart'
    as _i803;
import '../../features/Auth/forget_password/domain/repositories/forgot_password_repository.dart'
    as _i423;
import '../../features/Auth/forget_password/domain/repositories/reset_password_repository.dart'
    as _i1002;
import '../../features/Auth/forget_password/domain/usecases/reset_password_usecase.dart'
    as _i908;
import '../../features/Auth/forget_password/domain/usecases/send_email_verification_use_case.dart'
    as _i310;
import '../../features/Auth/forget_password/domain/usecases/verifiy_code_use_case.dart'
    as _i852;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i505.ApiService>(
      () => _i505.ApiService(gh<_i361.Dio>(), baseUrl: gh<String>()),
    );
    gh.factory<_i56.ResetPasswordRemoteDataSource>(
      () => _i106.ResetPasswordRemoteDataSourceImpl(
        apiService: gh<_i505.ApiService>(),
      ),
    );
    gh.factory<_i974.ForgetPasswordEmailRemoteDataSource>(
      () => _i326.ForgetPasswordEmailRemoteDataSourceImpl(
        apiService: gh<_i505.ApiService>(),
      ),
    );
    gh.factory<_i1027.EmailVerificationRemoteDataSource>(
      () => _i351.EmailVerificationRemoteDataSourceImpl(
        apiService: gh<_i505.ApiService>(),
      ),
    );
    gh.factory<_i1002.ResetPasswordRepository>(
      () => _i776.ResetPasswordRepositoryImpl(
        resetPasswordRemoteDataSource: gh<_i56.ResetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i423.ForgetPasswordEmailRepository>(
      () => _i360.ForgetPasswordEmailRepositoryImpl(
        forgetPasswordEmailRemoteDataSource:
            gh<_i974.ForgetPasswordEmailRemoteDataSource>(),
      ),
    );
    gh.factory<_i908.ResetPasswordUseCase>(
      () => _i908.ResetPasswordUseCase(gh<_i1002.ResetPasswordRepository>()),
    );
    gh.factory<_i803.EmailVerificationRepository>(
      () => _i501.EmailVerificationRepositoryImpl(
        emailVerificationRemoteDataSource:
            gh<_i1027.EmailVerificationRemoteDataSource>(),
      ),
    );
    gh.factory<_i852.VerifyEmailUseCase>(
      () => _i852.VerifyEmailUseCase(gh<_i803.EmailVerificationRepository>()),
    );
    gh.factory<_i310.SendEmailVerificationUseCase>(
      () => _i310.SendEmailVerificationUseCase(
        gh<_i423.ForgetPasswordEmailRepository>(),
      ),
    );
    return this;
  }
}

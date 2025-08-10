// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../Features/Auth/forget_password/data/data_sources/email_verification_remote_data_source.dart'
    as _i8;
import '../../Features/Auth/forget_password/data/data_sources/forgot_password_remote_data_source.dart'
    as _i14;
import '../../Features/Auth/forget_password/data/data_sources/reset_password_remote_data_source.dart'
    as _i24;
import '../../Features/Auth/forget_password/data/repositories/email_verification_repository_impl.dart'
    as _i11;
import '../../Features/Auth/forget_password/data/repositories/forgot_password_repository_impl.dart'
    as _i17;
import '../../Features/Auth/forget_password/data/repositories/reset_passsword_repository_impl.dart'
    as _i27;
import '../../Features/Auth/forget_password/domain/repositories/email_verification_repository.dart'
    as _i10;
import '../../Features/Auth/forget_password/domain/repositories/forgot_password_repository.dart'
    as _i16;
import '../../Features/Auth/forget_password/domain/repositories/reset_password_repository.dart'
    as _i26;
import '../../Features/Auth/forget_password/domain/usecases/reset_password_usecase.dart'
    as _i28;
import '../../Features/Auth/forget_password/domain/usecases/send_email_verification_use_case.dart'
    as _i29;
import '../../Features/Auth/forget_password/domain/usecases/verifiy_code_use_case.dart'
    as _i36;
import '../../Features/Auth/Login/data/data_sources/LoginDataSource.dart'
    as _i18;
import '../../Features/Auth/Login/data/data_sources/LoginDataSourceImp.dart'
    as _i19;
import '../../Features/Auth/Login/domain/repositories/LoginRepo.dart' as _i40;
import '../../Features/Auth/Login/domain/repositories/LoginRepoImpl.dart'
    as _i41;
import '../../Features/Auth/Login/domain/use_cases/LoginUseCase.dart' as _i42;
import '../../Features/Auth/Login/presentation/manager/login_cubit.dart'
    as _i49;
import '../../Features/Auth/Sign_up/data/data_sources/SignUpDataSource.dart'
    as _i30;
import '../../Features/Auth/Sign_up/data/data_sources/SignUpDataSourceImpl.dart'
    as _i31;
import '../../Features/Auth/Sign_up/domain/repositories/SignUpRepo.dart'
    as _i43;
import '../../Features/Auth/Sign_up/domain/repositories/SignUpRepoImpl.dart'
    as _i44;
import '../../Features/Auth/Sign_up/domain/use_cases/SignUpUseCase.dart'
    as _i45;
import '../../Features/Auth/Sign_up/presentation/manager/sign_up_cubit.dart'
    as _i50;
import '../../Features/Exam/presentation/Manager/exam_cubit.dart' as _i4;
import '../../Features/Home/data/data_source/exams_data_source.dart' as _i12;
import '../../Features/Home/data/data_source/questions_data_source.dart'
    as _i20;
import '../../Features/Home/data/data_source/subject_data_source.dart' as _i32;
import '../../Features/Home/data/repositories/exam_repo_impl.dart' as _i38;
import '../../Features/Home/data/repositories/questions_repo_impl.dart' as _i23;
import '../../Features/Home/data/repositories/subjects_repo_impl.dart' as _i35;
import '../../Features/Home/domain/repositories/exam_repo.dart' as _i37;
import '../../Features/Home/domain/repositories/questions_repo.dart' as _i22;
import '../../Features/Home/domain/repositories/subjects_repo.dart' as _i34;
import '../../Features/Home/domain/usecases/exams_usecase.dart' as _i39;
import '../../Features/Home/domain/usecases/questions_usecase.dart' as _i5;
import '../../Features/Home/domain/usecases/subject_usecase.dart' as _i46;
import '../../Features/Home/presentation/Manager/subjects_cubit.dart' as _i47;
import '../../Features/Home/presentation/Manager/subsubject_cubit.dart' as _i48;
import '../Locale/PrefsHelper.dart' as _i6;
import '../Remote/Api/APIClient.dart' as _i7;
import '../Remote/Api/network_module.dart' as _i51;
import '../Remote/dataSource/exams_data_source_impl.dart' as _i13;
import '../Remote/dataSource/forget_password/email_verification_data_source_impl.dart'
    as _i9;
import '../Remote/dataSource/forget_password/forgetPasswordDataSourceImpl.dart'
    as _i15;
import '../Remote/dataSource/forget_password/reset_password_data_source_impl.dart'
    as _i25;
import '../Remote/dataSource/questions_data_source_impl.dart' as _i21;
import '../Remote/dataSource/subject_data_source_impl.dart' as _i33;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i3.Dio>(
      () => networkModule.dioProvider(),
      preResolve: true,
    );
    gh.factory<_i4.ExamCubit>(() => _i4.ExamCubit(gh<_i5.QuestionsUsecase>()));
    gh.factory<_i6.PrefsHelper>(() => _i6.PrefsHelper());
    gh.factory<_i7.APIClient>(() => _i7.APIClient(gh<_i3.Dio>()));
    gh.factory<_i8.EmailVerificationRemoteDataSource>(() =>
        _i9.EmailVerificationRemoteDataSourceImpl(
            apiService: gh<_i7.APIClient>()));
    gh.factory<_i10.EmailVerificationRepository>(() =>
        _i11.EmailVerificationRepositoryImpl(
            emailVerificationRemoteDataSource:
                gh<_i8.EmailVerificationRemoteDataSource>()));
    gh.factory<_i12.ExamsDataSource>(
        () => _i13.ExamsDataSourceImpl(gh<_i7.APIClient>()));
    gh.factory<_i14.ForgetPasswordEmailRemoteDataSource>(() =>
        _i15.ForgetPasswordEmailRemoteDataSourceImpl(
            apiService: gh<_i7.APIClient>()));
    gh.factory<_i16.ForgetPasswordEmailRepository>(() =>
        _i17.ForgetPasswordEmailRepositoryImpl(
            forgetPasswordEmailRemoteDataSource:
                gh<_i14.ForgetPasswordEmailRemoteDataSource>()));
    gh.factory<_i18.Logindatasource>(
        () => _i19.LoginDataSourceImpl(gh<_i7.APIClient>()));
    gh.factory<_i20.QuestionsDataSource>(
        () => _i21.QuestionsDataSourceImpl(gh<_i7.APIClient>()));
    gh.factory<_i22.QuestionsRepo>(
        () => _i23.QuestionsRepoImpl(gh<_i20.QuestionsDataSource>()));
    gh.factory<_i24.ResetPasswordRemoteDataSource>(() =>
        _i25.ResetPasswordRemoteDataSourceImpl(
            apiService: gh<_i7.APIClient>()));
    gh.factory<_i26.ResetPasswordRepository>(() =>
        _i27.ResetPasswordRepositoryImpl(
            resetPasswordRemoteDataSource:
                gh<_i24.ResetPasswordRemoteDataSource>()));
    gh.factory<_i28.ResetPasswordUseCase>(
        () => _i28.ResetPasswordUseCase(gh<_i26.ResetPasswordRepository>()));
    gh.factory<_i29.SendEmailVerificationUseCase>(() =>
        _i29.SendEmailVerificationUseCase(
            gh<_i16.ForgetPasswordEmailRepository>()));
    gh.factory<_i30.Signupdatasource>(
        () => _i31.SignUpDataSourceImpl(gh<_i7.APIClient>()));
    gh.factory<_i32.SubjectDataSource>(
        () => _i33.SubjectDataSourceImpl(gh<_i7.APIClient>()));
    gh.factory<_i34.SubjectsRepository>(
        () => _i35.SubjectsRepoImpl(gh<_i32.SubjectDataSource>()));
    gh.factory<_i36.VerifyEmailUseCase>(
        () => _i36.VerifyEmailUseCase(gh<_i10.EmailVerificationRepository>()));
    gh.factory<_i37.ExamRepo>(
        () => _i38.ExamRepoImpl(gh<_i12.ExamsDataSource>()));
    gh.factory<_i39.ExamUseCase>(() => _i39.ExamUseCase(gh<_i37.ExamRepo>()));
    gh.factory<_i40.LoginRepo>(
        () => _i41.LoginRepoImpl(gh<_i18.Logindatasource>()));
    gh.factory<_i42.LoginUseCase>(
        () => _i42.LoginUseCase(gh<_i40.LoginRepo>()));
    gh.factory<_i43.SignUpRepo>(
        () => _i44.SignUpRepoImpl(gh<_i30.Signupdatasource>()));
    gh.factory<_i45.SignUpUseCase>(
        () => _i45.SignUpUseCase(gh<_i43.SignUpRepo>()));
    gh.factory<_i46.SubjectUseCase>(
        () => _i46.SubjectUseCase(gh<_i34.SubjectsRepository>()));
    gh.factory<_i47.SubjectsCubit>(
        () => _i47.SubjectsCubit(gh<_i46.SubjectUseCase>()));
    gh.factory<_i48.SubsubjectCubit>(
        () => _i48.SubsubjectCubit(gh<_i39.ExamUseCase>()));
    gh.factory<_i49.LogINCubit>(() => _i49.LogINCubit(
          gh<_i42.LoginUseCase>(),
          gh<_i3.Dio>(),
        ));
    gh.factory<_i50.SignUpCubit>(() => _i50.SignUpCubit(
          gh<_i45.SignUpUseCase>(),
          gh<_i3.Dio>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i51.NetworkModule {}

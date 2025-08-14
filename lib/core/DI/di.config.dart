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
    as _i6;
import '../../Features/Auth/forget_password/data/data_sources/forgot_password_remote_data_source.dart'
    as _i12;
import '../../Features/Auth/forget_password/data/data_sources/reset_password_remote_data_source.dart'
    as _i23;
import '../../Features/Auth/forget_password/data/repositories/email_verification_repository_impl.dart'
    as _i9;
import '../../Features/Auth/forget_password/data/repositories/forgot_password_repository_impl.dart'
    as _i15;
import '../../Features/Auth/forget_password/data/repositories/reset_passsword_repository_impl.dart'
    as _i26;
import '../../Features/Auth/forget_password/domain/repositories/email_verification_repository.dart'
    as _i8;
import '../../Features/Auth/forget_password/domain/repositories/forgot_password_repository.dart'
    as _i14;
import '../../Features/Auth/forget_password/domain/repositories/reset_password_repository.dart'
    as _i25;
import '../../Features/Auth/forget_password/domain/usecases/reset_password_usecase.dart'
    as _i27;
import '../../Features/Auth/forget_password/domain/usecases/send_email_verification_use_case.dart'
    as _i28;
import '../../Features/Auth/forget_password/domain/usecases/verifiy_code_use_case.dart'
    as _i35;
import '../../Features/Auth/forget_password/presentation/screens/forget_password/view_model/forget_password_cubit.dart'
    as _i40;
import '../../Features/Auth/Login/data/data_sources/LoginDataSource.dart'
    as _i16;
import '../../Features/Auth/Login/data/data_sources/LoginDataSourceImp.dart'
    as _i17;
import '../../Features/Auth/Login/domain/repositories/LoginRepo.dart' as _i41;
import '../../Features/Auth/Login/domain/repositories/LoginRepoImpl.dart'
    as _i42;
import '../../Features/Auth/Login/domain/use_cases/LoginUseCase.dart' as _i43;
import '../../Features/Auth/Login/presentation/manager/login_cubit.dart'
    as _i50;
import '../../Features/Auth/Sign_up/data/data_sources/SignUpDataSource.dart'
    as _i29;
import '../../Features/Auth/Sign_up/data/data_sources/SignUpDataSourceImpl.dart'
    as _i30;
import '../../Features/Auth/Sign_up/domain/repositories/SignUpRepo.dart'
    as _i44;
import '../../Features/Auth/Sign_up/domain/repositories/SignUpRepoImpl.dart'
    as _i45;
import '../../Features/Auth/Sign_up/domain/use_cases/SignUpUseCase.dart'
    as _i46;
import '../../Features/Auth/Sign_up/presentation/manager/sign_up_cubit.dart'
    as _i51;
import '../../Features/Exam/presentation/Manager/exam_cubit.dart' as _i36;
import '../../Features/Home/data/data_source/exams_data_source.dart' as _i10;
import '../../Features/Home/data/data_source/questions_data_source.dart'
    as _i18;
import '../../Features/Home/data/data_source/subject_data_source.dart' as _i31;
import '../../Features/Home/data/repositories/exam_repo_impl.dart' as _i38;
import '../../Features/Home/data/repositories/questions_repo_impl.dart' as _i21;
import '../../Features/Home/data/repositories/subjects_repo_impl.dart' as _i34;
import '../../Features/Home/domain/repositories/exam_repo.dart' as _i37;
import '../../Features/Home/domain/repositories/questions_repo.dart' as _i20;
import '../../Features/Home/domain/repositories/subjects_repo.dart' as _i33;
import '../../Features/Home/domain/usecases/exams_usecase.dart' as _i39;
import '../../Features/Home/domain/usecases/questions_usecase.dart' as _i22;
import '../../Features/Home/domain/usecases/subject_usecase.dart' as _i47;
import '../../Features/Home/presentation/Manager/subjects_cubit.dart' as _i48;
import '../../Features/Home/presentation/Manager/subsubject_cubit.dart' as _i49;
import '../Locale/PrefsHelper.dart' as _i4;
import '../Remote/Api/APIClient.dart' as _i5;
import '../Remote/Api/network_module.dart' as _i52;
import '../Remote/dataSource/exams_data_source_impl.dart' as _i11;
import '../Remote/dataSource/forget_password/email_verification_data_source_impl.dart'
    as _i7;
import '../Remote/dataSource/forget_password/forgetPasswordDataSourceImpl.dart'
    as _i13;
import '../Remote/dataSource/forget_password/reset_password_data_source_impl.dart'
    as _i24;
import '../Remote/dataSource/questions_data_source_impl.dart' as _i19;
import '../Remote/dataSource/subject_data_source_impl.dart' as _i32;

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
    gh.factory<_i4.PrefsHelper>(() => _i4.PrefsHelper());
    gh.factory<_i5.APIClient>(() => _i5.APIClient(gh<_i3.Dio>()));
    gh.factory<_i6.EmailVerificationRemoteDataSource>(() =>
        _i7.EmailVerificationRemoteDataSourceImpl(
            apiService: gh<_i5.APIClient>()));
    gh.factory<_i8.EmailVerificationRepository>(() =>
        _i9.EmailVerificationRepositoryImpl(
            emailVerificationRemoteDataSource:
                gh<_i6.EmailVerificationRemoteDataSource>()));
    gh.factory<_i10.ExamsDataSource>(
        () => _i11.ExamsDataSourceImpl(gh<_i5.APIClient>()));
    gh.factory<_i12.ForgetPasswordEmailRemoteDataSource>(() =>
        _i13.ForgetPasswordEmailRemoteDataSourceImpl(
            apiService: gh<_i5.APIClient>()));
    gh.factory<_i14.ForgetPasswordEmailRepository>(() =>
        _i15.ForgetPasswordEmailRepositoryImpl(
            forgetPasswordEmailRemoteDataSource:
                gh<_i12.ForgetPasswordEmailRemoteDataSource>()));
    gh.factory<_i16.Logindatasource>(
        () => _i17.LoginDataSourceImpl(gh<_i5.APIClient>()));
    gh.factory<_i18.QuestionsDataSource>(
        () => _i19.QuestionsDataSourceImpl(gh<_i5.APIClient>()));
    gh.factory<_i20.QuestionsRepo>(
        () => _i21.QuestionsRepoImpl(gh<_i18.QuestionsDataSource>()));
    gh.factory<_i22.QuestionsUsecase>(
        () => _i22.QuestionsUsecase(gh<_i20.QuestionsRepo>()));
    gh.factory<_i23.ResetPasswordRemoteDataSource>(() =>
        _i24.ResetPasswordRemoteDataSourceImpl(
            apiService: gh<_i5.APIClient>()));
    gh.factory<_i25.ResetPasswordRepository>(() =>
        _i26.ResetPasswordRepositoryImpl(
            resetPasswordRemoteDataSource:
                gh<_i23.ResetPasswordRemoteDataSource>()));
    gh.factory<_i27.ResetPasswordUseCase>(
        () => _i27.ResetPasswordUseCase(gh<_i25.ResetPasswordRepository>()));
    gh.factory<_i28.SendEmailVerificationUseCase>(() =>
        _i28.SendEmailVerificationUseCase(
            gh<_i14.ForgetPasswordEmailRepository>()));
    gh.factory<_i29.Signupdatasource>(
        () => _i30.SignUpDataSourceImpl(gh<_i5.APIClient>()));
    gh.factory<_i31.SubjectDataSource>(
        () => _i32.SubjectDataSourceImpl(gh<_i5.APIClient>()));
    gh.factory<_i33.SubjectsRepository>(
        () => _i34.SubjectsRepoImpl(gh<_i31.SubjectDataSource>()));
    gh.factory<_i35.VerifyEmailUseCase>(
        () => _i35.VerifyEmailUseCase(gh<_i8.EmailVerificationRepository>()));
    gh.factory<_i36.ExamCubit>(
        () => _i36.ExamCubit(gh<_i22.QuestionsUsecase>()));
    gh.factory<_i37.ExamRepo>(
        () => _i38.ExamRepoImpl(gh<_i10.ExamsDataSource>()));
    gh.factory<_i39.ExamUseCase>(() => _i39.ExamUseCase(gh<_i37.ExamRepo>()));
    gh.factory<_i40.ForgetPasswordCubit>(() => _i40.ForgetPasswordCubit(
        sendEmailVerificationUseCase: gh<_i28.SendEmailVerificationUseCase>()));
    gh.factory<_i41.LoginRepo>(
        () => _i42.LoginRepoImpl(gh<_i16.Logindatasource>()));
    gh.factory<_i43.LoginUseCase>(
        () => _i43.LoginUseCase(gh<_i41.LoginRepo>()));
    gh.factory<_i44.SignUpRepo>(
        () => _i45.SignUpRepoImpl(gh<_i29.Signupdatasource>()));
    gh.factory<_i46.SignUpUseCase>(
        () => _i46.SignUpUseCase(gh<_i44.SignUpRepo>()));
    gh.factory<_i47.SubjectUseCase>(
        () => _i47.SubjectUseCase(gh<_i33.SubjectsRepository>()));
    gh.factory<_i48.SubjectsCubit>(
        () => _i48.SubjectsCubit(gh<_i47.SubjectUseCase>()));
    gh.factory<_i49.SubsubjectCubit>(
        () => _i49.SubsubjectCubit(gh<_i39.ExamUseCase>()));
    gh.factory<_i50.LogINCubit>(() => _i50.LogINCubit(
          gh<_i43.LoginUseCase>(),
          gh<_i3.Dio>(),
        ));
    gh.factory<_i51.SignUpCubit>(() => _i51.SignUpCubit(
          gh<_i46.SignUpUseCase>(),
          gh<_i3.Dio>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i52.NetworkModule {}

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
    as _i29;
import '../../Features/Auth/forget_password/data/repositories/email_verification_repository_impl.dart'
    as _i11;
import '../../Features/Auth/forget_password/data/repositories/forgot_password_repository_impl.dart'
    as _i17;
import '../../Features/Auth/forget_password/data/repositories/reset_passsword_repository_impl.dart'
    as _i32;
import '../../Features/Auth/forget_password/domain/repositories/email_verification_repository.dart'
    as _i10;
import '../../Features/Auth/forget_password/domain/repositories/forgot_password_repository.dart'
    as _i16;
import '../../Features/Auth/forget_password/domain/repositories/reset_password_repository.dart'
    as _i31;
import '../../Features/Auth/forget_password/domain/usecases/reset_password_usecase.dart'
    as _i33;
import '../../Features/Auth/forget_password/domain/usecases/send_email_verification_use_case.dart'
    as _i34;
import '../../Features/Auth/forget_password/domain/usecases/verifiy_code_use_case.dart'
    as _i41;
import '../../Features/Auth/forget_password/presentation/screens/forget_password/view_model/forget_password_cubit.dart'
    as _i45;
import '../../Features/Auth/Login/data/data_sources/LoginDataSource.dart'
    as _i18;
import '../../Features/Auth/Login/data/data_sources/LoginDataSourceImp.dart'
    as _i19;
import '../../Features/Auth/Login/domain/repositories/LoginRepo.dart' as _i46;
import '../../Features/Auth/Login/domain/repositories/LoginRepoImpl.dart'
    as _i47;
import '../../Features/Auth/Login/domain/use_cases/LoginUseCase.dart' as _i48;
import '../../Features/Auth/Login/presentation/manager/login_cubit.dart'
    as _i56;
import '../../Features/Auth/Profile/data/data_source/Profile_DataSoucreImpl.dart'
    as _i21;
import '../../Features/Auth/Profile/data/data_source/Profile_DataSource.dart'
    as _i20;
import '../../Features/Auth/Profile/domain/repositories/ProfileRepo.dart'
    as _i22;
import '../../Features/Auth/Profile/domain/repositories/ProfileRepoImpl.dart'
    as _i23;
import '../../Features/Auth/Profile/domain/usecase/ProfileUsecase.dart' as _i24;
import '../../Features/Auth/Profile/presentation/manager/profile_cubit.dart'
    as _i49;
import '../../Features/Auth/Sign_up/data/data_sources/SignUpDataSource.dart'
    as _i35;
import '../../Features/Auth/Sign_up/data/data_sources/SignUpDataSourceImpl.dart'
    as _i36;
import '../../Features/Auth/Sign_up/domain/repositories/SignUpRepo.dart'
    as _i50;
import '../../Features/Auth/Sign_up/domain/repositories/SignUpRepoImpl.dart'
    as _i51;
import '../../Features/Auth/Sign_up/domain/use_cases/SignUpUseCase.dart'
    as _i52;
import '../../Features/Auth/Sign_up/presentation/manager/sign_up_cubit.dart'
    as _i57;
import '../../Features/Exam/presentation/Manager/exam_cubit.dart' as _i4;
import '../../Features/Home/data/data_source/exams_data_source.dart' as _i12;
import '../../Features/Home/data/data_source/questions_data_source.dart'
    as _i25;
import '../../Features/Home/data/data_source/subject_data_source.dart' as _i37;
import '../../Features/Home/data/repositories/exam_repo_impl.dart' as _i43;
import '../../Features/Home/data/repositories/questions_repo_impl.dart' as _i28;
import '../../Features/Home/data/repositories/subjects_repo_impl.dart' as _i40;
import '../../Features/Home/domain/repositories/exam_repo.dart' as _i42;
import '../../Features/Home/domain/repositories/questions_repo.dart' as _i27;
import '../../Features/Home/domain/repositories/subjects_repo.dart' as _i39;
import '../../Features/Home/domain/usecases/exams_usecase.dart' as _i44;
import '../../Features/Home/domain/usecases/questions_usecase.dart' as _i5;
import '../../Features/Home/domain/usecases/subject_usecase.dart' as _i53;
import '../../Features/Home/presentation/Manager/subjects_cubit.dart' as _i54;
import '../../Features/Home/presentation/Manager/subsubject_cubit.dart' as _i55;
import '../Locale/PrefsHelper.dart' as _i6;
import '../Remote/Api/APIClient.dart' as _i7;
import '../Remote/Api/network_module.dart' as _i58;
import '../Remote/dataSource/exams_data_source_impl.dart' as _i13;
import '../Remote/dataSource/forget_password/email_verification_data_source_impl.dart'
    as _i9;
import '../Remote/dataSource/forget_password/forgetPasswordDataSourceImpl.dart'
    as _i15;
import '../Remote/dataSource/forget_password/reset_password_data_source_impl.dart'
    as _i30;
import '../Remote/dataSource/questions_data_source_impl.dart' as _i26;
import '../Remote/dataSource/subject_data_source_impl.dart' as _i38;

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
    gh.factory<_i20.ProfileDatasource>(
        () => _i21.ProfileDataSourceImpl(gh<_i7.APIClient>()));
    gh.factory<_i22.ProfileRepo>(
        () => _i23.ProfileRepoImpl(gh<_i20.ProfileDatasource>()));
    gh.factory<_i24.ProfileUseCase>(
        () => _i24.ProfileUseCase(gh<_i22.ProfileRepo>()));
    gh.factory<_i25.QuestionsDataSource>(
        () => _i26.QuestionsDataSourceImpl(gh<_i7.APIClient>()));
    gh.factory<_i27.QuestionsRepo>(
        () => _i28.QuestionsRepoImpl(gh<_i25.QuestionsDataSource>()));
    gh.factory<_i29.ResetPasswordRemoteDataSource>(() =>
        _i30.ResetPasswordRemoteDataSourceImpl(
            apiService: gh<_i7.APIClient>()));
    gh.factory<_i31.ResetPasswordRepository>(() =>
        _i32.ResetPasswordRepositoryImpl(
            resetPasswordRemoteDataSource:
                gh<_i29.ResetPasswordRemoteDataSource>()));
    gh.factory<_i33.ResetPasswordUseCase>(
        () => _i33.ResetPasswordUseCase(gh<_i31.ResetPasswordRepository>()));
    gh.factory<_i34.SendEmailVerificationUseCase>(() =>
        _i34.SendEmailVerificationUseCase(
            gh<_i16.ForgetPasswordEmailRepository>()));
    gh.factory<_i35.Signupdatasource>(
        () => _i36.SignUpDataSourceImpl(gh<_i7.APIClient>()));
    gh.factory<_i37.SubjectDataSource>(
        () => _i38.SubjectDataSourceImpl(gh<_i7.APIClient>()));
    gh.factory<_i39.SubjectsRepository>(
        () => _i40.SubjectsRepoImpl(gh<_i37.SubjectDataSource>()));
    gh.factory<_i41.VerifyEmailUseCase>(
        () => _i41.VerifyEmailUseCase(gh<_i10.EmailVerificationRepository>()));
    gh.factory<_i42.ExamRepo>(
        () => _i43.ExamRepoImpl(gh<_i12.ExamsDataSource>()));
    gh.factory<_i44.ExamUseCase>(() => _i44.ExamUseCase(gh<_i42.ExamRepo>()));
    gh.factory<_i45.ForgetPasswordCubit>(() => _i45.ForgetPasswordCubit(
        sendEmailVerificationUseCase: gh<_i34.SendEmailVerificationUseCase>()));
    gh.factory<_i46.LoginRepo>(
        () => _i47.LoginRepoImpl(gh<_i18.Logindatasource>()));
    gh.factory<_i48.LoginUseCase>(
        () => _i48.LoginUseCase(gh<_i46.LoginRepo>()));
    gh.factory<_i49.ProfileCubit>(() => _i49.ProfileCubit(
          gh<_i24.ProfileUseCase>(),
          gh<_i3.Dio>(),
        ));
    gh.factory<_i50.SignUpRepo>(
        () => _i51.SignUpRepoImpl(gh<_i35.Signupdatasource>()));
    gh.factory<_i52.SignUpUseCase>(
        () => _i52.SignUpUseCase(gh<_i50.SignUpRepo>()));
    gh.factory<_i53.SubjectUseCase>(
        () => _i53.SubjectUseCase(gh<_i39.SubjectsRepository>()));
    gh.factory<_i54.SubjectsCubit>(
        () => _i54.SubjectsCubit(gh<_i53.SubjectUseCase>()));
    gh.factory<_i55.SubsubjectCubit>(
        () => _i55.SubsubjectCubit(gh<_i44.ExamUseCase>()));
    gh.factory<_i56.LogINCubit>(() => _i56.LogINCubit(
          gh<_i48.LoginUseCase>(),
          gh<_i3.Dio>(),
        ));
    gh.factory<_i57.SignUpCubit>(() => _i57.SignUpCubit(
          gh<_i52.SignUpUseCase>(),
          gh<_i3.Dio>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i58.NetworkModule {}

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

import '../../Features/Auth/Login/data/data_sources/LoginDataSource.dart'
    as _i10;
import '../../Features/Auth/Login/data/data_sources/LoginDataSourceImp.dart'
    as _i11;
import '../../Features/Auth/Login/domain/repositories/LoginRepo.dart' as _i25;
import '../../Features/Auth/Login/domain/repositories/LoginRepoImpl.dart'
    as _i26;
import '../../Features/Auth/Login/domain/use_cases/LoginUseCase.dart' as _i27;
import '../../Features/Auth/Login/presentation/manager/login_cubit.dart'
    as _i34;
import '../../Features/Auth/Sign_up/data/data_sources/SignUpDataSource.dart'
    as _i16;
import '../../Features/Auth/Sign_up/data/data_sources/SignUpDataSourceImpl.dart'
    as _i17;
import '../../Features/Auth/Sign_up/domain/repositories/SignUpRepo.dart'
    as _i28;
import '../../Features/Auth/Sign_up/domain/repositories/SignUpRepoImpl.dart'
    as _i29;
import '../../Features/Auth/Sign_up/domain/use_cases/SignUpUseCase.dart'
    as _i30;
import '../../Features/Auth/Sign_up/presentation/manager/sign_up_cubit.dart'
    as _i35;
import '../../Features/Exam/presentation/Manager/exam_cubit.dart' as _i4;
import '../../Features/Home/data/data_source/exams_data_source.dart' as _i8;
import '../../Features/Home/data/data_source/questions_data_source.dart'
    as _i12;
import '../../Features/Home/data/data_source/subject_data_source.dart' as _i18;
import '../../Features/Home/data/repositories/exam_repo_impl.dart' as _i23;
import '../../Features/Home/data/repositories/questions_repo_impl.dart' as _i15;
import '../../Features/Home/data/repositories/subjects_repo_impl.dart' as _i21;
import '../../Features/Home/domain/repositories/exam_repo.dart' as _i22;
import '../../Features/Home/domain/repositories/questions_repo.dart' as _i14;
import '../../Features/Home/domain/repositories/subjects_repo.dart' as _i20;
import '../../Features/Home/domain/usecases/exams_usecase.dart' as _i24;
import '../../Features/Home/domain/usecases/questions_usecase.dart' as _i5;
import '../../Features/Home/domain/usecases/subject_usecase.dart' as _i31;
import '../../Features/Home/presentation/Manager/subjects_cubit.dart' as _i32;
import '../../Features/Home/presentation/Manager/subsubject_cubit.dart' as _i33;
import '../Locale/PrefsHelper.dart' as _i6;
import '../Remote/Api/APIClient.dart' as _i7;
import '../Remote/Api/network_module.dart' as _i36;
import '../Remote/dataSource/exams_data_source_impl.dart' as _i9;
import '../Remote/dataSource/questions_data_source_impl.dart' as _i13;
import '../Remote/dataSource/subject_data_source_impl.dart' as _i19;

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
    gh.factory<_i8.ExamsDataSource>(
        () => _i9.ExamsDataSourceImpl(gh<_i7.APIClient>()));
    gh.factory<_i10.Logindatasource>(
        () => _i11.LoginDataSourceImpl(gh<_i7.APIClient>()));
    gh.factory<_i12.QuestionsDataSource>(
        () => _i13.QuestionsDataSourceImpl(gh<_i7.APIClient>()));
    gh.factory<_i14.QuestionsRepo>(
        () => _i15.QuestionsRepoImpl(gh<_i12.QuestionsDataSource>()));
    gh.factory<_i16.Signupdatasource>(
        () => _i17.SignUpDataSourceImpl(gh<_i7.APIClient>()));
    gh.factory<_i18.SubjectDataSource>(
        () => _i19.SubjectDataSourceImpl(gh<_i7.APIClient>()));
    gh.factory<_i20.SubjectsRepository>(
        () => _i21.SubjectsRepoImpl(gh<_i18.SubjectDataSource>()));
    gh.factory<_i22.ExamRepo>(
        () => _i23.ExamRepoImpl(gh<_i8.ExamsDataSource>()));
    gh.factory<_i24.ExamUseCase>(() => _i24.ExamUseCase(gh<_i22.ExamRepo>()));
    gh.factory<_i25.LoginRepo>(
        () => _i26.LoginRepoImpl(gh<_i10.Logindatasource>()));
    gh.factory<_i27.LoginUseCase>(
        () => _i27.LoginUseCase(gh<_i25.LoginRepo>()));
    gh.factory<_i28.SignUpRepo>(
        () => _i29.SignUpRepoImpl(gh<_i16.Signupdatasource>()));
    gh.factory<_i30.SignUpUseCase>(
        () => _i30.SignUpUseCase(gh<_i28.SignUpRepo>()));
    gh.factory<_i31.SubjectUseCase>(
        () => _i31.SubjectUseCase(gh<_i20.SubjectsRepository>()));
    gh.factory<_i32.SubjectsCubit>(
        () => _i32.SubjectsCubit(gh<_i31.SubjectUseCase>()));
    gh.factory<_i33.SubsubjectCubit>(
        () => _i33.SubsubjectCubit(gh<_i24.ExamUseCase>()));
    gh.factory<_i34.LogINCubit>(() => _i34.LogINCubit(
          gh<_i27.LoginUseCase>(),
          gh<_i3.Dio>(),
        ));
    gh.factory<_i35.SignUpCubit>(() => _i35.SignUpCubit(
          gh<_i30.SignUpUseCase>(),
          gh<_i3.Dio>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i36.NetworkModule {}

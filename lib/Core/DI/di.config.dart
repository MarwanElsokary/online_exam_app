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

import '../../Features/Auth/Sign_up/data/data_sources/SignUpDataSource.dart'
    as _i641;
import '../../Features/Auth/Sign_up/data/data_sources/SignUpDataSourceImpl.dart'
    as _i489;
import '../../Features/Auth/Sign_up/domain/repositories/SignUpRepo.dart'
    as _i545;
import '../../Features/Auth/Sign_up/domain/repositories/SignUpRepoImpl.dart'
    as _i934;
import '../../Features/Auth/Sign_up/domain/use_cases/SignUpUseCase.dart'
    as _i492;
import '../../Features/Auth/Sign_up/presentation/manager/sign_up_cubit.dart'
    as _i3;
import '../../Features/Home/data/data_source/exams_data_source.dart' as _i434;
import '../../Features/Home/data/data_source/subject_data_source.dart' as _i4;
import '../../Features/Home/data/repositories/exam_repo_impl.dart' as _i697;
import '../../Features/Home/data/repositories/subjects_repo_impl.dart' as _i263;
import '../../Features/Home/domain/repositories/exam_repo.dart' as _i404;
import '../../Features/Home/domain/repositories/subjects_repo.dart' as _i928;
import '../../Features/Home/domain/usecases/exams_usecase.dart' as _i40;
import '../../Features/Home/domain/usecases/subject_usecase.dart' as _i1025;
import '../../Features/Home/presentation/Manager/subjects_cubit.dart' as _i298;
import '../Locale/PrefsHelper.dart' as _i338;
import '../Remote/Api/APIClient.dart' as _i1040;
import '../Remote/Api/network_module.dart' as _i709;
import '../Remote/dataSource/exams_data_source_impl.dart' as _i990;
import '../Remote/dataSource/subject_data_source_impl.dart' as _i1064;

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
    final networkModule = _$NetworkModule();
    gh.factory<_i338.PrefsHelper>(() => _i338.PrefsHelper());
    gh.lazySingleton<_i361.Dio>(() => networkModule.dioProvider());
    gh.factory<_i1040.APIClient>(() => _i1040.APIClient(gh<_i361.Dio>()));
    gh.factory<_i641.Signupdatasource>(
        () => _i489.SignUpDataSourceImpl(gh<_i1040.APIClient>()));
    gh.factory<_i434.ExamsDataSource>(
        () => _i990.ExamsDataSourceImpl(gh<_i1040.APIClient>()));
    gh.factory<_i4.SubjectDataSource>(
        () => _i1064.SubjectDataSourceImpl(gh<_i1040.APIClient>()));
    gh.factory<_i404.ExamRepo>(
        () => _i697.ExamRepoImpl(gh<_i434.ExamsDataSource>()));
    gh.factory<_i928.SubjectsRepository>(
        () => _i263.SubjectsRepoImpl(gh<_i4.SubjectDataSource>()));
    gh.factory<_i545.SignUpRepo>(
        () => _i934.SignUpRepoImpl(gh<_i641.Signupdatasource>()));
    gh.factory<_i40.ExamUseCase>(() => _i40.ExamUseCase(gh<_i404.ExamRepo>()));
    gh.factory<_i1025.SubjectUseCase>(
        () => _i1025.SubjectUseCase(gh<_i928.SubjectsRepository>()));
    gh.factory<_i492.SignUpUseCase>(
        () => _i492.SignUpUseCase(gh<_i545.SignUpRepo>()));
    gh.factory<_i3.SignUpCubit>(() => _i3.SignUpCubit(
          gh<_i492.SignUpUseCase>(),
          gh<_i361.Dio>(),
        ));
    gh.factory<_i298.SubjectsCubit>(
        () => _i298.SubjectsCubit(gh<_i1025.SubjectUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i709.NetworkModule {}

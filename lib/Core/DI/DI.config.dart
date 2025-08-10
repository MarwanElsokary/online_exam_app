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
    as _i5;
import '../../Features/Auth/Login/data/data_sources/LoginDataSourceImp.dart'
    as _i6;
import '../../Features/Auth/Login/domain/repositories/LoginRepo.dart' as _i14;
import '../../Features/Auth/Login/domain/repositories/LoginRepoImpl.dart'
    as _i15;
import '../../Features/Auth/Login/domain/use_cases/LoginUseCase.dart' as _i16;
import '../../Features/Auth/Login/presentation/manager/login_cubit.dart'
    as _i21;
import '../../Features/Auth/Profile/data/data_source/Profile_DataSoucreImpl.dart'
    as _i8;
import '../../Features/Auth/Profile/data/data_source/Profile_DataSource.dart'
    as _i7;
import '../../Features/Auth/Profile/domain/repositories/ProfileRepo.dart'
    as _i9;
import '../../Features/Auth/Profile/domain/repositories/ProfileRepoImpl.dart'
    as _i10;
import '../../Features/Auth/Profile/domain/usecase/ProfileUsecase.dart' as _i11;
import '../../Features/Auth/Profile/presentation/manager/profile_cubit.dart'
    as _i17;
import '../../Features/Auth/Sign_up/data/data_sources/SignUpDataSource.dart'
    as _i12;
import '../../Features/Auth/Sign_up/data/data_sources/SignUpDataSourceImpl.dart'
    as _i13;
import '../../Features/Auth/Sign_up/domain/repositories/SignUpRepo.dart'
    as _i18;
import '../../Features/Auth/Sign_up/domain/repositories/SignUpRepoImpl.dart'
    as _i19;
import '../../Features/Auth/Sign_up/domain/use_cases/SignUpUseCase.dart'
    as _i20;
import '../../Features/Auth/Sign_up/presentation/manager/sign_up_cubit.dart'
    as _i22;
import '../Remote/Api/APIClient.dart' as _i4;
import '../Remote/Api/network_module.dart' as _i23;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i3.Dio>(() => networkModule.dioProvider());
    gh.singleton<_i4.APIClient>(() => _i4.APIClient(gh<_i3.Dio>()));
    gh.factory<_i5.Logindatasource>(
        () => _i6.LoginDataSourceImpl(gh<_i4.APIClient>()));
    gh.factory<_i7.ProfileDatasource>(
        () => _i8.ProfileDataSourceImpl(gh<_i4.APIClient>()));
    gh.factory<_i9.ProfileRepo>(
        () => _i10.ProfileRepoImpl(gh<_i7.ProfileDatasource>()));
    gh.factory<_i11.ProfileUseCase>(
        () => _i11.ProfileUseCase(gh<_i9.ProfileRepo>()));
    gh.factory<_i12.Signupdatasource>(
        () => _i13.SignUpDataSourceImpl(gh<_i4.APIClient>()));
    gh.factory<_i14.LoginRepo>(
        () => _i15.LoginRepoImpl(gh<_i5.Logindatasource>()));
    gh.factory<_i16.LoginUseCase>(
        () => _i16.LoginUseCase(gh<_i14.LoginRepo>()));
    gh.factory<_i17.ProfileCubit>(() => _i17.ProfileCubit(
          gh<_i11.ProfileUseCase>(),
          gh<_i3.Dio>(),
        ));
    gh.factory<_i18.SignUpRepo>(
        () => _i19.SignUpRepoImpl(gh<_i12.Signupdatasource>()));
    gh.factory<_i20.SignUpUseCase>(
        () => _i20.SignUpUseCase(gh<_i18.SignUpRepo>()));
    gh.factory<_i21.LogINCubit>(() => _i21.LogINCubit(
          gh<_i16.LoginUseCase>(),
          gh<_i3.Dio>(),
        ));
    gh.factory<_i22.SignUpCubit>(() => _i22.SignUpCubit(
          gh<_i20.SignUpUseCase>(),
          gh<_i3.Dio>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i23.NetworkModule {}

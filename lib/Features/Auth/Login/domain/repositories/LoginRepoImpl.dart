import 'package:dartz/dartz.dart';


import 'package:injectable/injectable.dart';

import '../../data/data_sources/LoginDataSource.dart';
import '../entities/LogInEntity.dart';
import 'LoginRepo.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  Logindatasource logindatasource;

  @factoryMethod
  LoginRepoImpl(this.logindatasource);

  @override
  Future<Either<String,LogInEntity>> loginuser({
    required String email,
    required String pass,
  }) async {
    // bool isconnected = await InternetChecker.CheckNetwork();
    if (true) {
      var result = await logindatasource.login_user(
        email: email,
        pass: pass,
      );

      return result.fold((error) {
        return  left(error);
      }, (response) {
        return Right(response.toLoginentity());

      });
    }
    // else {
    //   return Right("No Internet Connection");
    // }
  }
}

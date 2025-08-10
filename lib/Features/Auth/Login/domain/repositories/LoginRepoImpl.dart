import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../Core/Resources/InternetChecker.dart';
import '../../data/data_sources/LoginDataSource.dart';
import '../entities/LogInEntity.dart';
import 'LoginRepo.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  Logindatasource logindatasource;

  @factoryMethod
  LoginRepoImpl(this.logindatasource);

  @override
  Future<Either<LogInEntity, String>> loginuser({
    required String email,
    required String pass,
  }) async {
    bool isconnected = await InternetChecker.CheckNetwork();
    if (isconnected) {
      var result = await logindatasource.login_user(
        email: email,
        pass: pass,
      );
      return result.fold((responce) {
        return left(responce.toLoginentity());
      }, (error) {
        return Right(error);
      });
    } else {
      return Right("No Internet Connection");
    }
  }
}

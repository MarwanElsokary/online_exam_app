import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../../Core/Remote/Api/APIClient.dart';
import '../models/LogInResponse.dart';
import 'LoginDataSource.dart';

@Injectable(as: Logindatasource)
class LoginDataSourceImpl implements Logindatasource {
  APIClient apiClient;

  @factoryMethod
  LoginDataSourceImpl(this.apiClient);

  @override
  Future<Either<String, LoginResponce>> login_user({
    required String email,
    required String pass,
  }) async {
    try {
      var result = await apiClient.login(
        email: email,
        pass: pass,
      );
      if (result.message == null) {
        return left(result.message!);

      } else {
        return Right(result);
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}

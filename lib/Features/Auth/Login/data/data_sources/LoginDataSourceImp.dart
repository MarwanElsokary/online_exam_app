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
  Future<Either<LoginResponce, String>> login_user({
    required String email,
    required String pass,
  }) async {
    try {
      var result = await apiClient.login(
        email: email,
        pass: pass,
      );
      if (result.message != null) {
        return Right(result.message!);
      } else {
        return left(result);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }
}

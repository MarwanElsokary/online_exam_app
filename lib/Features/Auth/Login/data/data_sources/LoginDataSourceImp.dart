import 'package:dartz/dartz.dart';
import 'package:exams/Core/Remote/Api/APIClient.dart';
import 'package:exams/Features/Auth/Login/data/data_sources/LoginDataSource.dart';
import 'package:exams/Features/Auth/Login/data/models/LogInResponse.dart';
import 'package:injectable/injectable.dart';

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

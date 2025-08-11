import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../../Core/Remote/Api/APIClient.dart';
import '../models/SignUpResponce.dart';
import 'SignUpDataSource.dart';

@Injectable(as: Signupdatasource)
class SignUpDataSourceImpl extends Signupdatasource {
  APIClient apiClient;

  @factoryMethod
  SignUpDataSourceImpl(this.apiClient);

  @override
  Future<Either<SignUpResponce, String>> registeruser(
      {required String firstname,
      required String secondname,
      required String username,
      required String email,
      required String phone,
      required String pass,
      required String repass}) async {
    try {
      var result = await apiClient.signup(
          firstname: firstname,
          secondname: secondname,
          username: username,
          email: email,
          phone: phone,
          pass: pass,
          repass: repass);
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

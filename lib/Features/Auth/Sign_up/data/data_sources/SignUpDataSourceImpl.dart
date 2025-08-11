import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Remote/Api/APIClient.dart';
import 'package:online_exam/Features/Auth/Sign_up/data/data_sources/SignUpDataSource.dart';
import 'package:online_exam/Features/Auth/Sign_up/data/models/SignUpResponce.dart';

import '../../../../../Core/Locale/PrefsHelper.dart';

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
      if (result.token != null) {
        await PrefsHelper.SaveToken(result.token!);
        print("Token saved: ${result.token}");
      } else {
        print("No token received from signup");
      }
      return Left(result);
    } catch (e) {
      print("Error during signup: $e");
      return Right(e.toString());
    }
  }
}

import 'package:dartz/dartz.dart';

import '../models/LogInResponse.dart';


abstract class Logindatasource {
  Future<Either<String, LoginResponce>> login_user({
    required String email,
    required String pass,
  });
}

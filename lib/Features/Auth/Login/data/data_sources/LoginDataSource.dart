import 'package:dartz/dartz.dart';
import 'package:exams/Features/Auth/Login/data/models/LogInResponse.dart';

abstract class Logindatasource {
  Future<Either<LoginResponce, String>> login_user({
    required String email,
    required String pass,
  });
}

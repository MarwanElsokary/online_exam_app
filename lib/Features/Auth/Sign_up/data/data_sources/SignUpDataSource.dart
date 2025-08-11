import 'package:dartz/dartz.dart';

import '../models/SignUpResponce.dart';

abstract class Signupdatasource {
  Future<Either<SignUpResponce,String>>registeruser({
    required String firstname,
    required String secondname,
    required String username,
    required String email,
    required String  phone,
    required String pass,
    required String repass});
}
import 'package:dartz/dartz.dart';
import 'package:online_exam/Features/Auth/Sign_up/data/models/SignUpResponce.dart';
import 'package:online_exam/Features/Auth/Sign_up/domain/entities/SignUpEntity.dart';

abstract class SignUpRepo{
  Future<Either<SignUpEntity,String>>registeruser({required String firstname,
    required String secondname,
    required String username,
    required String email,
    required String  phone,
    required String pass,
    required String repass});
}
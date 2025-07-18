import 'package:dartz/dartz.dart';
import 'package:exams/Features/Auth/Login/domain/entities/LogInEntity.dart';

abstract class LoginRepo{
  Future<Either<LogInEntity,String>>loginuser({

    required String email,
    required String pass,
    });
}
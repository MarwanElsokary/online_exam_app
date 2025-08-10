import 'package:dartz/dartz.dart';
import '../entities/LogInEntity.dart';

abstract class LoginRepo{
  Future<Either<LogInEntity,String>>loginuser({

    required String email,
    required String pass,
    });
}
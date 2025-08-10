import 'package:dartz/dartz.dart';
import 'package:exams/Features/Auth/Profile/domain/entities/ProfileEntity.dart';

abstract class ProfileRepo{
  Future<Either<String,ProfileEntity>>profileuser({
    required String token,
     String? firstname,
     String? secondname,
     String?username,
     String? email,
     String?  phone,


});
}
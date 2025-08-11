import 'package:dartz/dartz.dart';

import '../entities/ProfileEntity.dart';

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



import 'package:dartz/dartz.dart';

import '../models/ProfileResponse.dart';

abstract class ProfileDatasource{
  Future<Either<String,ProfileResponse>> profileuser({
    required String token,
     String? firstname,
     String? secondname,
     String?username,
     String? email,
     String?  phone,


  });
}
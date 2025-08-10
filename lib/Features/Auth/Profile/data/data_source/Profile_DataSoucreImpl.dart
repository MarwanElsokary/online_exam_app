import 'package:dartz/dartz.dart';
import 'package:exams/Core/Remote/Api/APIClient.dart';
import 'package:injectable/injectable.dart';

import '../models/ProfileResponse.dart';
import 'Profile_DataSource.dart';


@Injectable(as: ProfileDatasource)
class ProfileDataSourceImpl extends ProfileDatasource {
  APIClient apiClient;
 String token="sd";
  @factoryMethod
  ProfileDataSourceImpl(this.apiClient);


  @override
  Future<Either<String,ProfileResponse>> profileuser(
      {required String token,
       String? firstname,
       String? secondname,
       String? username,
       String? email,
       String? phone,
})async  {
    try {
      var result = await apiClient.profiledata(
        token: token,
          firstname: firstname,
          secondname: secondname,
          username: username,
          email: email,
          phone: phone,
          );
      if (result.message != null) {
        return left(result.message!);
      } else {
        return Right(result);
      }
    } catch (e) {
      return left(e.toString());
    }
    // TODO: implement profileuser
  }
}

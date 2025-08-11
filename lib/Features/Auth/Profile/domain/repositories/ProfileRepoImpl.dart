import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../../Core/Resources/InternetChecker.dart';
import '../../data/data_source/Profile_DataSource.dart';
import '../entities/ProfileEntity.dart';
import 'ProfileRepo.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  ProfileDatasource profileDatasource;

  @factoryMethod
  ProfileRepoImpl(this.profileDatasource);

  @override
  Future<Either<String, ProfileEntity>> profileuser({
    required String token,
    String? firstname,
    String? secondname,
    String? username,
    String? email,
    String? phone,
  }) async {
    bool isconnected = await InternetChecker.CheckNetwork();
    if (isconnected) {
      var result = await profileDatasource.profileuser(
        token: token,
        firstname: firstname,
        secondname: secondname,
        username: username,
        email: email,
        phone: phone,
      );
      return result.fold((error) {
        return left(error);
      }, (response) {
        return Right(response.toprofile_entity());
      });
    } else {
      return left("No Internet Connection");
    }
    // TODO: implement profileuser
  }
}

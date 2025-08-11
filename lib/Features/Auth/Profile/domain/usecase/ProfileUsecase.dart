
import 'package:injectable/injectable.dart';

import '../../../../../Core/Locale/PrefsHelper.dart';
import '../repositories/ProfileRepo.dart';

@injectable
class ProfileUseCase {
  ProfileRepo profileRepo;
  String? token = PrefsHelper.getToken();

  @factoryMethod
  ProfileUseCase(this.profileRepo);

  call({
    required String token,
    String? firstname,
    String? secondname,
    String? username,
    String? email,
    String? phone,
  }) =>
      profileRepo.profileuser(
        token: token,
        firstname: firstname,
        secondname: secondname,
        username: username,
        email: email,
        phone: phone,
      );
}

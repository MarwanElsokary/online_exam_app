import 'package:exams/Core/Locale/PrefsHelper.dart';
import 'package:exams/Features/Auth/Profile/domain/repositories/ProfileRepo.dart';
import 'package:injectable/injectable.dart';

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

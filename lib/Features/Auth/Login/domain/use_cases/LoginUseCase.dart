import 'package:injectable/injectable.dart';

import '../repositories/LoginRepo.dart';

@injectable
class LoginUseCase {
  LoginRepo loginrepo;

  @factoryMethod
  LoginUseCase(this.loginrepo);

  call({

    required String email,
    required String pass,
  }) =>
      loginrepo.loginuser(
        email: email,
        pass: pass,
      );
}

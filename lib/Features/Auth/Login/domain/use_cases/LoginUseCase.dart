

import 'package:exams/Features/Auth/Login/domain/repositories/LoginRepo.dart';

import 'package:injectable/injectable.dart';

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

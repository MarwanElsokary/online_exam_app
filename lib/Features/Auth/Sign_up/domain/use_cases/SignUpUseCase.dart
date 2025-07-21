import 'package:exams/Features/Auth/Sign_up/domain/repositories/SignUpRepo.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/SignUpResponce.dart';

@injectable
class SignUpUseCase {
  SignUpRepo signuprepo;
  @factoryMethod
  SignUpUseCase(this.signuprepo);
  call({required String firstname,
    required String secondname,
    required String username,
    required String email,
    required String  phone,
    required String pass,
    required String repass})=>signuprepo.registeruser(
      firstname: firstname,
      secondname: secondname,
      username: username,
      email: email,
      phone: phone,
      pass: pass,
      repass: repass);
}
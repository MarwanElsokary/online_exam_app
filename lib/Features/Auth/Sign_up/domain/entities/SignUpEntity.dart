

import 'package:exams/Features/Auth/Sign_up/data/models/SignUpResponce.dart';

class SignUpEntity {
  SignUpEntity({
      this.message, 
      this.token, 
      this.user,});

  String? message;
  String? token;
  User? user;


}
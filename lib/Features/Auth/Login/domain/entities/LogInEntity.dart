

import 'package:exams/Features/Auth/Login/data/models/LogInResponse.dart';

class LogInEntity {
  LogInEntity({
    this.message,
    this.token,
    this.user,});

  String? message;
  String? token;
  User? user;


}
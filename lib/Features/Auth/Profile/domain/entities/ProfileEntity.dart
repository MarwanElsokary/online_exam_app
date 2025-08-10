
import 'package:exams/Features/Auth/Profile/data/models/ProfileResponse.dart';

class ProfileEntity{


  String? message;
  String? token;
  User? user;
  ProfileEntity({
    this.message,
    this.token,
    this.user,
});
}
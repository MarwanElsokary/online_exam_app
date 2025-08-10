import 'package:json_annotation/json_annotation.dart';

import '../../../Sign_up/data/models/SignUpResponce.dart';
import '../../domain/entities/LogInEntity.dart';

part 'LogInResponse.g.dart';

@JsonSerializable()
class LoginResponce {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final User? user;

  LoginResponce ({
    this.message,
    this.token,
    this.user,
  });

  factory LoginResponce.fromJson(Map<String, dynamic> json) {
    return _$LoginResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginResponceToJson(this);
  }
  LogInEntity toLoginentity(){
    return LogInEntity(token: token,user: user,message: message);

  }
}
//
// @JsonSerializable()
// class User {
//   @JsonKey(name: "username")
//   final String? username;
//   @JsonKey(name: "firstName")
//   final String? firstName;
//   @JsonKey(name: "lastName")
//   final String? lastName;
//   @JsonKey(name: "email")
//   final String? email;
//   @JsonKey(name: "phone")
//   final String? phone;
//   @JsonKey(name: "isVerified")
//   final bool? isVerified;
//   @JsonKey(name: "_id")
//   final String? Id;
//
//   User ({
//     this.username,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.phone,
//     this.isVerified,
//     this.Id,
//
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return _$UserFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() {
//     return _$UserToJson(this);
//   }
// }



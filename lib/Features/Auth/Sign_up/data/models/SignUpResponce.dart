import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/Features/Auth/Sign_up/domain/entities/SignUpEntity.dart';

part 'SignUpResponce.g.dart';

@JsonSerializable()
class SignUpResponce {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final User? user;

  SignUpResponce ({
    this.message,
    this.token,
    this.user,
  });

  factory SignUpResponce.fromJson(Map<String, dynamic> json) {
    return _$SignUpResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignUpResponceToJson(this);
  }
   SignUpEntity tosignupentity(){
    return SignUpEntity(token: token,user: user,message: message);

  }
}

@JsonSerializable()
class User {
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "_id")
  final String? Id;

  User ({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.isVerified,
    this.Id,

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}



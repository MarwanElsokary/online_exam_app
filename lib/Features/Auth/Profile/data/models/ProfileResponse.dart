import 'package:exams/Features/Auth/Profile/domain/entities/ProfileEntity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ProfileResponse.g.dart';

@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final User? user;

  ProfileResponse ({
    this.message,
    this.user,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return _$ProfileResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProfileResponseToJson(this);
  }
  ProfileEntity toprofile_entity(){
    return ProfileEntity(message:message,user:user);
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  final String? Id;
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
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  User ({
    this.Id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.isVerified,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}



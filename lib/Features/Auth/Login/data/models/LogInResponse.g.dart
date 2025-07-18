// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LogInResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponce _$LoginResponceFromJson(Map<String, dynamic> json) =>
    LoginResponce(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponceToJson(LoginResponce instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };

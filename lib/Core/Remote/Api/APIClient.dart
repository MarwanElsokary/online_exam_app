
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../Features/Auth/Login/data/models/LogInResponse.dart';
import '../../../Features/Auth/Profile/data/models/ProfileResponse.dart';
import '../../../Features/Auth/Sign_up/data/models/SignUpResponce.dart';

part 'APIClient.g.dart';

@singleton
@RestApi(baseUrl: 'https://exam.elevateegy.com/api')
abstract class APIClient {
  @factoryMethod
  factory APIClient(
    Dio dio,
  ) = _APIClient;

  @POST('/v1/auth/signup')
  Future<SignUpResponce> signup(
      {@Field() required String firstname,
      @Field() required String secondname,
      @Field() required String username,
      @Field() required String email,
      @Field() required String phone,
      @Field() required String pass,
      @Field() required String repass});

  @POST('/v1/auth/signin')
  Future<LoginResponce> login({
    @Field() required String email,
    @Field() required String pass,
  });

  @POST('/v1/auth/login')
  Future<ProfileResponse> profiledata({
    @Header('token') required String token,
    @Field() String? firstname,
    @Field()  String? secondname,
    @Field()  String? username,
    @Field()  String? email,
    @Field()  String? phone,

  });
}

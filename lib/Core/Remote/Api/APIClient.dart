import 'package:exams/Features/Auth/Login/data/models/LogInResponse.dart';
import 'package:exams/Features/Auth/Sign_up/data/models/SignUpResponce.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'APIClient.g.dart';

@RestApi(baseUrl:'https://exam.elevateegy.com/api/')
abstract class APIClient{
  factory APIClient(Dio dio, {String? baseUrl}) = _APIClient;
  @POST('/v1/auth/signup')
  Future<SignUpResponce>signup(
  { @Field()required String firstname,@Field()required String secondname,
   @Field()required String username,@Field()required String email,
   @Field()required String phone,@Field()required String pass,
   @Field()required String repass

  });
  @POST('/v1/auth/login')
  Future<LoginResponce>login(
      {
        @Field()required String email
        ,@Field()required String pass,
      });


}
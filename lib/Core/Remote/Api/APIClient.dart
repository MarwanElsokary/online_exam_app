import 'package:injectable/injectable.dart';
import 'package:online_exam/Features/Auth/Sign_up/data/models/SignUpResponce.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'APIClient.g.dart';

@injectable
@singleton
@RestApi(baseUrl: 'https://exam.elevateegy.com/api/')
abstract class APIClient {
  @factoryMethod
  factory APIClient(Dio dio) = _APIClient;

  @POST('/v1/auth/signup')
  Future<SignUpResponce> signup(
      {@Field() required String firstname,
      @Field() required String secondname,
      @Field() required String username,
      @Field() required String email,
      @Field() required String phone,
      @Field() required String pass,
      @Field() required String repass});
}

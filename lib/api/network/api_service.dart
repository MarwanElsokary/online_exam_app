import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/request/email_verification_request/email_verification_request.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../request/forget_password_request/forget_password_email_request.dart';
import '../request/reset_password_request/reset_password_request.dart';
import '../response/email_verification_response/email_verification_response.dart';
import '../response/forget_password_response/forget_password_response.dart';
import '../response/reset_password_response/reset_password_response.dart';

part 'api_service.g.dart';

@injectable
@RestApi(baseUrl: "https://exam.elevateegy.com")
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('/auth/forgotPassword')
  Future<ForgetPasswordResponse> sendEmailVerification({
    @Body() required ForgetPasswordEmailRequest request,
  });

  @POST("/v1/auth/verifyResetCode")
  Future<EmailVerificationResponse> verifyResetCode({
    @Body() required EmailVerificationRequest request,
  });


  @PUT("/v1/auth/resetPassword")
  Future<ResetPasswordResponse> resetPassword({
    @Body() required ResetPasswordRequest request,
  });
}

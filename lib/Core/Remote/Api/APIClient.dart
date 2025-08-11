import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Remote/requests/submit_exam_request.dart';
import 'package:online_exam/Core/Remote/response/responses/subject_response.dart';
import 'package:online_exam/Features/Auth/Sign_up/data/models/SignUpResponce.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../Features/Auth/Login/data/models/LogInResponse.dart';
import '../../../Features/Auth/Profile/data/models/ProfileResponse.dart';
import '../requests/email_verification_request/email_verification_request.dart';
import '../requests/forget_password_request/forget_password_email_request.dart';
import '../requests/reset_password_request/reset_password_request.dart';
import '../response/email_verification_response/email_verification_response.dart';
import '../response/forget_password_response/forget_password_response.dart';
import '../response/reset_password_response/reset_password_response.dart';
import '../response/responses/exam_response.dart';
import '../response/responses/questions_response.dart';

part 'APIClient.g.dart';

@injectable
@singleton
@RestApi(baseUrl: 'https://exam.elevateegy.com/api/')
abstract class APIClient {
  @factoryMethod
  factory APIClient(Dio dio) = _APIClient;

  @POST('/v1/auth/signup')
  Future<SignUpResponce> signup(
      {@Field("firstName") required String firstname,
      @Field("lastName") required String secondname,
      @Field("username") required String username,
      @Field("email") required String email,
      @Field("phone") required String phone,
      @Field("password") required String pass,
      @Field("rePassword") required String repass});

  @GET("/v1/subjects")
  Future<AllSubjectResponse> getAllSubjects(
      {@Header("token") required String? token});

  @GET("/v1/exams")
  Future<ExamResponse> getExamsBySubjectId({
    @Header("token") required String? token,
    // improve
    @Query("subject") required String subjectId,
  });

  @POST("/v1/auth/signin")
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
  @GET("/v1/exams/{id}")
  Future<QuestionsResponse> getExamById({
    @Path("id") required String examId,
    @Header("token")  String? token,
  });

//
  @POST("/v1/questions/check")
  Future<QuestionsResponse> checkQuestions({
    @Body() required SubmitExamRequest request,
    @Header("token") required String? token,
  });

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

import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Remote/requests/submit_exam_request.dart';
import 'package:online_exam/Core/Remote/response/responses/subject_response.dart';
import 'package:online_exam/Features/Auth/Sign_up/data/models/SignUpResponce.dart';
import 'package:exams/Features/Auth/Login/data/models/LogInResponse.dart';
import 'package:exams/Features/Auth/Sign_up/data/models/SignUpResponce.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../response/responses/exam_response.dart';
import '../response/responses/questions_response.dart';

part 'APIClient.g.dart';

@injectable
@singleton
@RestApi(baseUrl: 'https://exam.elevateegy.com/api/')
abstract class APIClient {
  @factoryMethod
  factory APIClient(Dio dio) = _APIClient;

@RestApi(baseUrl:'https://exam.elevateegy.com/api/')
abstract class APIClient{
  factory APIClient(Dio dio, {String? baseUrl}) = _APIClient;
  @POST('/v1/auth/signup')
  Future<SignUpResponce>signup(
  { @Field()required String firstname,@Field()required String secondname,
   @Field()required String username,@Field()required String email,
   @Field()required String phone,@Field()required String pass,
   @Field()required String repass
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
  @POST('/v1/auth/login')
  Future<LoginResponce>login(
      {
        @Field()required String email
        ,@Field()required String pass,
      });

  @GET("/v1/exams/{id}")
  Future<QuestionsResponse> getExamById({
    @Path("id") required String examId,
    @Header("token") required String? token,
  });

//
  @POST("/v1/questions/check")
  Future<QuestionsResponse> checkQuestions({
    @Body() required SubmitExamRequest request,
    @Header("token") required String? token,
  });
}

import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Remote/response/responses/subject_response.dart';
import 'package:online_exam/Features/Auth/Sign_up/data/models/SignUpResponce.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../response/responses/exam_response.dart';

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

  @GET("/v1/subjects")
  Future<AllSubjectResponse> getAllSubjects(
      {@Header("token") required String? token});

  @GET("/v1/exams")
  Future<ExamResponse> getExamsBySubjectId({
    @Query("subject") required String subjectId,
  });


  // sec

  @GET("/v1/exams/{id}")
  Future<ExamResponse> getExamById(
    @Path("id") String examId,
  );

  // @GET("/v1/questions?exam={id}")
  // Future<ExamResponse> getExamById(
  //   @Path("id") String examId,
  // );
}

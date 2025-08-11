import 'package:online_exam/Core/Remote/requests/submit_exam_request.dart';

import 'package:online_exam/Core/Remote/response/responses/check_questions_response.dart';

import '../../../../Core/Locale/PrefsHelper.dart';
import '../../domain/repositories/check_questions_repo.dart';
import '../data_source/check_questions_data_source.dart';

class CheckQuestionsRepoImpl implements CheckQuestionsRepo {
  final CheckQuestionsDataSource remoteDataSource;

  CheckQuestionsRepoImpl({required this.remoteDataSource});

  @override
  Future<List<CorrectQuestions>> correctQuestions(
      {required SubmitExamRequest request}) async {
    final token = PrefsHelper.getToken();
    if (token == null) {
      throw Exception("User is not logged in");
    }
    return await remoteDataSource.correctQuestions(
        request: request, token: token);
  }

  @override
  Future<List<WrongQuestions>> wrongQuestions({
    required SubmitExamRequest request,
  }) async {
    final token = PrefsHelper.getToken();
    if (token == null) {
      throw Exception("User is not logged in");
    }
    return await remoteDataSource.wrongQuestions(
        request: request, token: token);
  }
}

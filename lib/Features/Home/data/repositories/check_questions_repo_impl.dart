import 'package:online_exam/Core/Remote/requests/submit_exam_request.dart';

import 'package:online_exam/Core/Remote/response/responses/check_questions_response.dart';

import '../../../../Core/Locale/PrefsHelper.dart';
import '../../domain/repositories/check_questions_repo.dart';
import '../data_source/check_questions_data_source.dart';

class CheckQuestionsRepoImpl implements CheckQuestionsRepo {
  final CheckQuestionsDataSource remoteDataSource;
  final String? _token = PrefsHelper.getToken();

  CheckQuestionsRepoImpl({required this.remoteDataSource});

  @override
  Future<List<CorrectQuestions>> correctQuestions(
      {required SubmitExamRequest request, required String token}) async {
    return await remoteDataSource.correctQuestions(
        request: request, token: _token ?? token);
  }

  @override
  Future<List<WrongQuestions>> wrongQuestions(
      {required SubmitExamRequest request, required String token}) async {
    return await remoteDataSource.wrongQuestions(
        request: request, token: _token ?? token);
  }
}

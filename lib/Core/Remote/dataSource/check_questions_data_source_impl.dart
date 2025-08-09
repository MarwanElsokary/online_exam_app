import 'package:online_exam/Core/Remote/Api/APIClient.dart';

import '../../../Features/Home/data/data_source/check_questions_data_source.dart';
import '../requests/submit_exam_request.dart';
import '../response/responses/check_questions_response.dart';

class CheckQuestionsDataSourceImpl implements CheckQuestionsDataSource {
  final APIClient _checkQuestionsApi;

  CheckQuestionsDataSourceImpl(this._checkQuestionsApi);

  @override
  Future<List<CorrectQuestions>> correctQuestions(
      {required SubmitExamRequest request, required String token}) async {
    var response =
        await _checkQuestionsApi.checkQuestions(request: request, token: token);
    return response.questions!
        .map((e) => CorrectQuestions(
              QID: e.Id,
              correctAnswer: e.correct,
              Question: e.question,
            ))
        .toList();
  }

  @override
  Future<List<WrongQuestions>> wrongQuestions(
      {required SubmitExamRequest request, required String token}) async {
    var response =
        await _checkQuestionsApi.checkQuestions(request: request, token: token);
    return response.questions!
        .map((e) => WrongQuestions(
              QID: e.Id,
              Question: e.question,
              correctAnswer: e.correct,
            ))
        .toList();
  }
}

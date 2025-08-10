import '../../../../Core/Remote/requests/submit_exam_request.dart';
import '../../../../Core/Remote/response/responses/check_questions_response.dart';

abstract class CheckQuestionsDataSource {
  Future<List<WrongQuestions>> wrongQuestions({
    required SubmitExamRequest request,
    required String token,
  });

  Future<List<CorrectQuestions>> correctQuestions({
    required SubmitExamRequest request,
    required String token,
  });
}

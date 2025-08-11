import '../../../../Core/Remote/requests/submit_exam_request.dart';
import '../../../../Core/Remote/response/responses/check_questions_response.dart';

abstract class CheckQuestionsRepo {
  Future<List<WrongQuestions>> wrongQuestions({
    required SubmitExamRequest request,
  });

  Future<List<CorrectQuestions>> correctQuestions({
    required SubmitExamRequest request,
  });
}

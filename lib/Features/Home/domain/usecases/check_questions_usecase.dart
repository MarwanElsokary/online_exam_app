import 'package:online_exam/Features/Home/domain/repositories/check_questions_repo.dart';

import '../../../../Core/Remote/requests/submit_exam_request.dart';
import '../../../../Core/Remote/response/responses/check_questions_response.dart';

class CheckQuestionsUseCase {
  final CheckQuestionsRepo questions;

  CheckQuestionsUseCase(this.questions);

  Future<List<CorrectQuestions>> correctQuestions({
    required SubmitExamRequest request,
    required String token,
  }) async {
    return await questions.correctQuestions(
      request: request,
      token: token,
    );
  }

  Future<List<WrongQuestions>> wrongQuestions({
    required SubmitExamRequest request,
    required String token,
  }) async {
    return await questions.wrongQuestions(
      request: request,
      token: token,
    );
  }
}

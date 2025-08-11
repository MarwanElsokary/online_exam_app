import '../../../../Core/Remote/response/responses/questions_response.dart';

abstract class QuestionsRepo {
  Future<List<Questions>> getQuestions({
    required String examId,
  });
}

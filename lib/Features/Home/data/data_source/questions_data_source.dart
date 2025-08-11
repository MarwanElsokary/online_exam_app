import '../../../../Core/Remote/response/responses/questions_response.dart';

abstract class QuestionsDataSource {
  Future<List<Questions>> getQuestions({
    required String examId,
    required String token,
  });
}

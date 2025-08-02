import '../../../../Core/Remote/response/responses/questions_response.dart';

abstract class QuestionsRepo {
  Future<List<Questions>> getQuestions({
    String? examId,
    String? token,
    String? Id,
    String? title,
    String? duration,
    String? subject,
    String? numberOfQuestions,
    String? active,
    String? createdAt,
  });
}

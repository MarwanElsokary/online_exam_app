import '../../../../Core/Remote/response/responses/exam_response.dart';

abstract class ExamRepo {
  Future<List<Exam>> getExams({
    String? id,
    String? title,
    int? duration,
    String? subject,
    int? numberOfQuestions,
    bool? active,
    String? createdAt,
  });
}

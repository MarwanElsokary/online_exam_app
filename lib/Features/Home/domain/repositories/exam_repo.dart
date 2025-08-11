import '../../../../Core/Remote/response/responses/exam_response.dart';

abstract class ExamRepo {
  Future<List<Exam>> getExams({
    required String? id,
  });
}

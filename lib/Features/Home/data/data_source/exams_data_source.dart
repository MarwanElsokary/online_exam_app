import '../../../../Core/Remote/response/responses/exam_response.dart';

abstract class ExamsDataSource {
  Future<List<Exam>> getExams({
    required String id,
    required String token,
  });
}

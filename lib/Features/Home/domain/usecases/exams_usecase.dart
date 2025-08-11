import 'package:injectable/injectable.dart';
import 'package:online_exam/Features/Home/domain/repositories/exam_repo.dart';

import '../../../../Core/Remote/response/responses/exam_response.dart';

@injectable
class ExamUseCase {
  final ExamRepo examRepo;

  ExamUseCase(this.examRepo);

  Future<List<Exam>> invoke({
    String? id,
  }) {
    return examRepo.getExams(
      id: id,
    );
  }
}

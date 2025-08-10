import 'package:injectable/injectable.dart';
import 'package:online_exam/Features/Home/domain/repositories/exam_repo.dart';

import '../../../../Core/Remote/response/responses/exam_response.dart';

@injectable
 class ExamUseCase {
  ExamRepo examRepo;

  ExamUseCase(this.examRepo);

  Future<List<Exam>> invoke({
    String? id,
    String? title,
    int? duration,
    String? subject,
    int? numberOfQuestions,
    bool? active,
    String? createdAt,
  }) {
    return examRepo.getExams(
      id: id,
      title: title,
      duration: duration,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
      active: active,
      createdAt: createdAt,
    );
  }
}

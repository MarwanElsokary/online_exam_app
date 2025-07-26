import 'package:injectable/injectable.dart';
import '../../../../Core/Remote/response/responses/exam_response.dart';
import '../../domain/repositories/exam_repo.dart';

@Injectable(as: ExamRepo)

class ExamRepoImpl implements ExamRepo {
  ExamRepo _ExamRepo;

  ExamRepoImpl(this._ExamRepo);

  @override
  Future<List<Exam>> getExams({
    String? id,
    String? title,
    int? duration,
    String? subject,
    int? numberOfQuestions,
    bool? active,
    String? createdAt,
  }) {
    return _ExamRepo.getExams(
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

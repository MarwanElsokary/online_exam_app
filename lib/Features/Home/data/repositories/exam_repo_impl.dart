import 'package:injectable/injectable.dart';
import 'package:online_exam/Features/Home/data/data_source/exams_data_source.dart';
import '../../../../Core/Remote/response/responses/exam_response.dart';
import '../../domain/repositories/exam_repo.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  ExamsDataSource _ExamRepo;

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
    return _ExamRepo.getExams();
  }
}

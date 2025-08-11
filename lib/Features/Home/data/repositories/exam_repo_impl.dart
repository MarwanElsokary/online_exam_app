import 'package:injectable/injectable.dart';
import 'package:online_exam/Features/Home/data/data_source/exams_data_source.dart';
import '../../../../Core/Locale/PrefsHelper.dart';
import '../../../../Core/Remote/response/responses/exam_response.dart';
import '../../domain/repositories/exam_repo.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  final ExamsDataSource _examRepo;

  ExamRepoImpl(this._examRepo);

  @override
  Future<List<Exam>> getExams({
    String? id,
  }) {
    final token = PrefsHelper.getToken();
    if (token == null) {
      throw Exception("User is not logged in");
    }
    return _examRepo.getExams(id: id ?? '', token: token);
  }
}

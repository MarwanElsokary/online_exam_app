import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Remote/Api/APIClient.dart';
import 'package:online_exam/Features/Home/data/data_source/exams_data_source.dart';

import '../response/responses/exam_response.dart';

@Injectable(as: ExamsDataSource)
class ExamsDataSourceImpl implements ExamsDataSource {
  final APIClient _cllient;

  ExamsDataSourceImpl(this._cllient);

  @override
  Future<List<Exam>> getExams({
    required String id,
    required String token,
  }) async {
    var response =
        await _cllient.getExamsBySubjectId(subjectId: id, token: token);
    return response.exam!
        .map((e) => Exam(
              Id: e.Id,
              title: e.title,
              duration: e.duration,
              subject: e.subject,
              numberOfQuestions: e.numberOfQuestions,
              active: e.active,
              createdAt: e.createdAt,
            ))
        .toList();
  }
}

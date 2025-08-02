import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Remote/Api/APIClient.dart';
import 'package:online_exam/Core/Remote/response/responses/exam_response.dart';

import '../../../Features/Home/data/data_source/questions_data_source.dart';
import '../../Locale/PrefsHelper.dart';
import '../response/responses/questions_response.dart' show Questions;

@Injectable(as: QuestionsDataSource)
class QuestionsDataSourceImpl implements QuestionsDataSource {
  final APIClient _client;
  final String? token = PrefsHelper.getToken();
  final String? examId = Exam().Id;

  QuestionsDataSourceImpl(this._client);

  @override
  Future<List<Questions>> getQuestions(
      {required String examId, required String token}) async {
    var response = await _client.getExamById(token: token, examId: examId);
    return response.questions!
        .map((e) => Questions(
              Id: e.Id,
              question: e.question,
              answers: e.answers,
              type: e.type,
              correct: e.correct,
              subject: e.subject,
              createdAt: e.createdAt,
            ))
        .toList();
  }
}

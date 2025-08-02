import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Remote/response/responses/questions_response.dart';
import 'package:online_exam/Features/Home/data/data_source/questions_data_source.dart';

import '../../domain/repositories/questions_repo.dart';

@Injectable(as: QuestionsRepo)
class QuestionsRepoImpl implements QuestionsRepo {
  QuestionsDataSource _questionsDataSource;

  QuestionsRepoImpl(this._questionsDataSource);

  @override
  Future<List<Questions>> getQuestions({
    String? examId,
    String? token,
    String? Id,
    String? title,
    String? duration,
    String? subject,
    String? numberOfQuestions,
    String? active,
    String? createdAt,
  }) {
    return _questionsDataSource.getQuestions(
      examId: examId ?? '',
      token: token ?? '',
    );
  }
}

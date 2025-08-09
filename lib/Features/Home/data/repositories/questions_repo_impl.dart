import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Locale/PrefsHelper.dart';
import 'package:online_exam/Core/Remote/response/responses/questions_response.dart';
import 'package:online_exam/Features/Home/data/data_source/questions_data_source.dart';

import '../../domain/repositories/questions_repo.dart';

@Injectable(as: QuestionsRepo)
class QuestionsRepoImpl implements QuestionsRepo {
  final QuestionsDataSource _questionsDataSource;

  const QuestionsRepoImpl(this._questionsDataSource);

  @override
  Future<List<Questions>> getQuestions({
    required String examId,
  }) async {
    return await _questionsDataSource.getQuestions(
      examId: examId,
      token: PrefsHelper.getToken() ?? "",
    );
  }
}

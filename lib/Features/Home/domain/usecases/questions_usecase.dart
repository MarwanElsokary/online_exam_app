import 'package:online_exam/Features/Home/domain/repositories/questions_repo.dart';

import '../../../../Core/Remote/response/responses/questions_response.dart';
import 'check_questions_usecase.dart';

class QuestionsUsecase {
  final QuestionsRepo _questionsRepo;

  QuestionsUsecase(this._questionsRepo);

  Future<List<Questions>> invoke({
    required String examId,
  }) {
    return _questionsRepo.getQuestions(
      examId: examId,
    );
  }
}

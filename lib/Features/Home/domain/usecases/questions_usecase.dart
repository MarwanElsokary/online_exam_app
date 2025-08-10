import 'package:injectable/injectable.dart';
import 'package:online_exam/Features/Home/domain/repositories/questions_repo.dart';

import '../../../../Core/Remote/response/responses/questions_response.dart';
@injectable
import 'check_questions_usecase.dart';

class QuestionsUsecase {
  QuestionsRepo questionsRepo;
@factoryMethod
  QuestionsUsecase(this.questionsRepo);
  final QuestionsRepo _questionsRepo;

  QuestionsUsecase(this._questionsRepo);

  Future<List<Questions>> invoke({
    required String examId,
  }) {
    return questionsRepo.getQuestions(
      examId: examId,
    );
  }
}

import 'package:injectable/injectable.dart';
import 'package:online_exam/Features/Home/domain/repositories/questions_repo.dart';

import '../../../../Core/Remote/response/responses/questions_response.dart';
@injectable
class QuestionsUsecase {
  QuestionsRepo questionsRepo;
@factoryMethod
  QuestionsUsecase(this.questionsRepo);

  Future<List<Questions>> invoke({
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
    return questionsRepo.getQuestions(
      examId: examId,
      token: token,
      Id: Id,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
      active: active,
      title: title,
      duration: duration,
      createdAt: createdAt,
    );
  }
}

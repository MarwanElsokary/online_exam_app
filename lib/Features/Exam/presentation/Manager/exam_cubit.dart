import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/Core/Remote/response/responses/questions_response.dart';
import 'package:online_exam/Features/Home/domain/repositories/exam_repo.dart';
import 'package:online_exam/Features/Home/domain/repositories/questions_repo.dart';
import 'package:online_exam/Features/Home/domain/usecases/questions_usecase.dart';

part 'exam_state.dart';
@injectable
class ExamCubit extends Cubit<ExamState> {
  QuestionsUsecase questionsusecase;

  @factoryMethod
  ExamCubit(this.questionsusecase) : super(ExamInitial());

  static ExamCubit get(context) => BlocProvider.of(context);

  QuestionsRepo get questionRepository => questionsusecase.questionsRepo;
 List<Questions?> questions=[];

  Future<void> GetAllQuestions({
    String? examId,
    String? token,
    String? Id,
    String? title,
    String? duration,
    String? subject,
    String? numberOfQuestions,
    String? active,
    String? createdAt,}) async {
    emit(ExamLoadingState());
    try {
      questions = await questionsusecase.invoke(
        examId: examId,
        token: token,
        Id: Id,
        title: title,
        duration: duration,
        subject: subject,
        numberOfQuestions: numberOfQuestions,
        active: active,
        createdAt: createdAt,
      );
      emit(ExamSuccesState(questions));
    } catch (error) {
      emit(ExamErrorState(error.toString()));
    }
  }
}



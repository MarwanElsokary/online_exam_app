
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/Features/Home/domain/model/exams.dart';
import 'package:online_exam/Features/Home/domain/model/subject.dart';
import 'package:online_exam/Features/Home/domain/repositories/exam_repo.dart';
import 'package:online_exam/Features/Home/domain/usecases/exams_usecase.dart';

part 'subsubject_state.dart';

@injectable
class SubsubjectCubit extends Cubit<SubsubjectState> {
  ExamUseCase examUseCase;

  @factoryMethod
  SubsubjectCubit(this.examUseCase) : super(SubsubjectInitial());

  static SubsubjectCubit get(context) => BlocProvider.of(context);

  ExamRepo get examRepository => examUseCase.examRepo;
  // solve this issue by using the call method on examUseCase
  List<Exams> exams = [];

  Future<void> getallexams() async {
    emit(SubsubjectsLoadingState());
    try {
      exams = (await examUseCase.invoke()).cast<Exams>();
      emit(SubsubjectsSuccesState(exams as Exams));
    } catch (error) {
      emit(SubsubjectsErrorState(error.toString()));
    }
  }
}

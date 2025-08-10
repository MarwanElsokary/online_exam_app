import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/Core/Remote/response/responses/subject_response.dart';
import 'package:online_exam/Features/Home/domain/model/subject.dart';
import 'package:online_exam/Features/Home/domain/repositories/subjects_repo.dart';
import 'package:online_exam/Features/Home/domain/usecases/subject_usecase.dart';

part 'subjects_state.dart';
@injectable
class SubjectsCubit extends Cubit<SubjectsState> {
  final SubjectUseCase subjectUseCase;

  @factoryMethod
  SubjectsCubit(this.subjectUseCase) : super(SubjectsInitial());

  static SubjectsCubit get(context) => BlocProvider.of(context);

  List<Subjects> subjects = [];

  Future<void> getAllSubjects() async {
    emit(SubjectsLoadingState());
    try {
      subjects = await subjectUseCase.invoke();
      emit(SubjectsSuccesState(subjects)); // صح هنا
    } catch (error) {
      emit(SubjectsErrorState(error.toString()));
    }
  }

  void selectSubject(Subjects subject) {
    emit(SubjectSelectedState(subject)); // state مختلفة للـ selection
  }
}

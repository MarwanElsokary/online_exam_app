part of 'exam_cubit.dart';

@immutable
sealed class ExamState {}

final class ExamInitial extends ExamState {}
class ExamLoadingState extends ExamState{}
class ExamErrorState extends ExamState{
  String error;
  ExamErrorState(this.error);
}
class ExamSuccesState extends ExamState{
    List<Questions?> question;
  ExamSuccesState(this.question);
}

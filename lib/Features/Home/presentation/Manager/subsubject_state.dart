part of 'subsubject_cubit.dart';

@immutable
sealed class SubsubjectState {}

final class SubsubjectInitial extends SubsubjectState {}
class SubsubjectsLoadingState extends SubsubjectState{}
class SubsubjectsErrorState extends SubsubjectState{
  String error;
  SubsubjectsErrorState(this.error);
}
class SubsubjectsSuccesState extends SubsubjectState{
  Exams exams;
  SubsubjectsSuccesState(this.exams);
}

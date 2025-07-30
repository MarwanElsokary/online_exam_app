part of 'subjects_cubit.dart';

@immutable
sealed class SubjectsState {}

final class SubjectsInitial extends SubjectsState {}
class SubjectsLoadingState extends SubjectsState{}
class SubjectsErrorState extends SubjectsState{
  String error;
  SubjectsErrorState(this.error);
}
class SubjectsSuccesState extends SubjectsState{
Subject subjects;
SubjectsSuccesState(this.subjects);
}

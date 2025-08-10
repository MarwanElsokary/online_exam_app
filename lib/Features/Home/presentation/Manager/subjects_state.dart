part of 'subjects_cubit.dart';

@immutable
abstract class SubjectsState {}

class SubjectsInitial extends SubjectsState {}

class SubjectsLoadingState extends SubjectsState {}

class SubjectsSuccesState extends SubjectsState {
  final List<Subjects> subjects;
  SubjectsSuccesState(this.subjects);
}

class SubjectSelectedState extends SubjectsState {
  final Subjects subject;
  SubjectSelectedState(this.subject);
}

class SubjectsErrorState extends SubjectsState {
  final String error;
  SubjectsErrorState(this.error);
}

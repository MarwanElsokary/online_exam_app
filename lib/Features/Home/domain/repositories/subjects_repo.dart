import 'package:online_exam/Core/Remote/response/responses/subject_response.dart';

abstract class SubjectsRepository {
  Future<List<Subjects>> getAllSubjects();
}

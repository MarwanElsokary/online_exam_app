import 'package:online_exam/Core/Remote/response/all_subject/subject_response.dart';

abstract class SubjectDataSource {
  Future<List<Subjects>> getAllSubjects({int page = 1, int limit = 10});
}

import 'package:online_exam/Features/Home/domain/repositories/subjects_repo.dart';

import '../../../../Core/Remote/response/all_subject/subject_response.dart';

abstract class SubjectUseCase {
  SubjectsRepository _repository;

  SubjectUseCase(this._repository);

  Future<List<Subjects>> invoke({
    int page = 1,
    int limit = 10,
  }) {
    return _repository.getAllSubjects(
      page: page,
      limit: limit,
    );
  }
}

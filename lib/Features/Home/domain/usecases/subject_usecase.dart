import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Remote/response/responses/subject_response.dart';
import 'package:online_exam/Features/Home/domain/repositories/subjects_repo.dart';

@injectable
class SubjectUseCase {
  SubjectsRepository _repository;

  SubjectUseCase(this._repository);

  Future<List<Subjects>> invoke() {
    return _repository.getAllSubjects();
  }
}

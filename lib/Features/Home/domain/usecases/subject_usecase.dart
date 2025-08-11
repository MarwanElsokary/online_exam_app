import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Remote/response/responses/subject_response.dart';
import 'package:online_exam/Features/Home/domain/repositories/subjects_repo.dart';

@injectable
class SubjectUseCase {
  SubjectsRepository repository;

  SubjectUseCase(this.repository);

  Future<List<Subjects>> invoke() {
    return repository.getAllSubjects();
  }
}

import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Remote/response/all_subject/subject_response.dart';
import 'package:online_exam/Features/Home/data/data_source/getAllSubject/subject_data_source.dart';
import 'package:online_exam/Features/Home/domain/model/subject.dart';
import '../../domain/repositories/subjects_repo.dart';

@Injectable(as: SubjectsRepository)
class SubjectsRepoImpl extends SubjectsRepository {
  SubjectDataSource _subjectDataSource;

  SubjectsRepoImpl(this._subjectDataSource);

  @override
  Future<List<Subjects>> getAllSubjects({
    int page = 1,
    int limit = 10,
  }) {
    return _subjectDataSource.getAllSubjects(
      limit: limit,
      page: page,
    );
  }
}

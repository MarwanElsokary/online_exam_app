import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Remote/response/responses/subject_response.dart';
import 'package:online_exam/Features/Home/data/data_source/subject_data_source.dart';
import '../../../../Core/Locale/PrefsHelper.dart';
import '../../domain/repositories/subjects_repo.dart';

@Injectable(as: SubjectsRepository)
class SubjectsRepoImpl extends SubjectsRepository {
  final SubjectDataSource _subjectDataSource;

  SubjectsRepoImpl(this._subjectDataSource);

  @override
  Future<List<Subjects>> getAllSubjects() {
    return _subjectDataSource.getAllSubjects(
        token: PrefsHelper.getToken() ?? "");
  }
}

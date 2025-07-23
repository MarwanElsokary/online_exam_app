import 'package:online_exam/Core/Remote/Api/APIClient.dart';
import 'package:online_exam/Core/Remote/response/all_subject/subject_response.dart';
import '../../../Features/Home/data/data_source/getAllSubject/subject_data_source.dart';

class SubjectDataSourceImpl implements SubjectDataSource {
  APIClient _client;

  SubjectDataSourceImpl(this._client);

  @override
  Future<List<Subjects>> getAllSubjects(
      {int limit = 10, int page = 1, String? keyword}) async {
    var response = await _client.getAllSubjects(
      limit: limit,
      page: page,
    );
    return response.subjects?.toList() ?? [];
  }
}

import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Locale/PrefsHelper.dart';
import 'package:online_exam/Core/Remote/Api/APIClient.dart';
import 'package:online_exam/Core/Remote/response/responses/subject_response.dart';
import '../../../Features/Home/data/data_source/subject_data_source.dart';
import '../response/responses/subject_response.dart';

@Injectable(as: SubjectDataSource)
class SubjectDataSourceImpl implements SubjectDataSource {
  APIClient _client;

  SubjectDataSourceImpl(this._client);

  @override
  Future<List<Subjects>> getAllSubjects() async {
    var response = await _client.getAllSubjects(token: PrefsHelper.getToken());
    // return response.subjects?.toList() ?? [];
    return response.subjects!
        .map((e) => Subjects(
              Id: e.Id,
              name: e.name,
              icon: e.icon,
              createdAt: e.createdAt,
            ))
        .toList();
  }
}

import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Remote/Api/APIClient.dart';
import 'package:online_exam/Core/Remote/response/responses/subject_response.dart';
import '../../../Features/Home/data/data_source/subject_data_source.dart';

@Injectable(as: SubjectDataSource)
class SubjectDataSourceImpl implements SubjectDataSource {
  final APIClient _client;

  SubjectDataSourceImpl(this._client);

  @override
  Future<List<Subjects>> getAllSubjects({required String token}) async {
    var response = await _client.getAllSubjects(token: token);
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

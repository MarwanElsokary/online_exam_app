import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/network/api_service.dart';

import '../../../core/utils/app_text.dart';
import '../../../core/utils/connection_manager.dart';
import '../../../features/Auth/forget_password/data/data_sources/forgot_password_remote_data_source.dart';
import '../../request/forget_password_request/forget_password_email_request.dart';

@Injectable(as: ForgetPasswordEmailRemoteDataSource)
class ForgetPasswordEmailRemoteDataSourceImpl
    implements ForgetPasswordEmailRemoteDataSource {
  final ApiService apiService;
  @factoryMethod
  const ForgetPasswordEmailRemoteDataSourceImpl({required this.apiService});

  @override
  Future<String?> sendEmailVerification({required String email}) async {
    try {
      final bool connection = await ConnectionManager.checkConnection();
      if (connection) {
        var response = await apiService.sendEmailVerification(
          request: ForgetPasswordEmailRequest(email: email),
        );
        return response.info;
      } else {
        throw AppText.connectionValidation;
      }
    } catch (error) {
      throw "Error occurred while sending email verification: $error";
    }
  }
}

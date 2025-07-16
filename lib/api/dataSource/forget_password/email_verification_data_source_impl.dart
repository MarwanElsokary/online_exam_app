import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/network/api_service.dart';
import 'package:project_one_c3_team/api/request/email_verification_request/email_verification_request.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/utils/connection_manager.dart';
import '../../../features/forget_password/data/data_sources/email_verification_remote_data_source.dart';

@Injectable(as: EmailVerificationRemoteDataSource)
class EmailVerificationRemoteDataSourceImpl
    implements EmailVerificationRemoteDataSource {
  final ApiService apiService;

  @factoryMethod
  const EmailVerificationRemoteDataSourceImpl({required this.apiService});

  @override
  Future<String?> verifyEmailCode({required String code}) async {
    try {
      final bool connection = await ConnectionManager.checkConnection();
      if (connection) {
        var response = await apiService.verifyResetCode(
          request: EmailVerificationRequest(resetCode: code),
        );
        return response.status;
      } else {
        throw AppText.connectionValidation;
      }
    } catch (error) {
      throw "Error occurred while verifying email code: $error";
    }
  }
}

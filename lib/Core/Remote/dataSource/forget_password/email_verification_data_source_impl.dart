import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Remote/Api/APIClient.dart';

import '../../../../Features/Auth/forget_password/data/data_sources/email_verification_remote_data_source.dart';
import '../../../utils/app_text.dart';
import '../../../utils/connection_manager.dart';
import '../../requests/email_verification_request/email_verification_request.dart';

@Injectable(as: EmailVerificationRemoteDataSource)
class EmailVerificationRemoteDataSourceImpl
    implements EmailVerificationRemoteDataSource {
  final APIClient apiService;

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

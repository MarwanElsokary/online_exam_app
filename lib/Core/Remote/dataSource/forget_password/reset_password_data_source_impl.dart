import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Remote/Api/APIClient.dart';

import '../../../../Features/Auth/forget_password/data/data_sources/reset_password_remote_data_source.dart';
import '../../../utils/app_text.dart';
import '../../../utils/connection_manager.dart';
import '../../requests/reset_password_request/reset_password_request.dart';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl
    implements ResetPasswordRemoteDataSource {
  final APIClient apiService;

  @factoryMethod
  const ResetPasswordRemoteDataSourceImpl({required this.apiService});

  @override
  Future<String?> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    try {
      final bool connection = await ConnectionManager.checkConnection();
      if (connection) {
        var response = await apiService.resetPassword(
          request: ResetPasswordRequest(email: email, newPassword: newPassword),
        );
        return response.message;
      } else {
        throw AppText.connectionValidation;
      }
    } catch (error) {
      throw " some thing went wrong";
    }
  }
}

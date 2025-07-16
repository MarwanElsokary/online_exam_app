import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/api/network/api_service.dart';

import '../../../core/utils/app_text.dart';
import '../../../core/utils/connection_manager.dart';
import '../../../features/forget_password/data/data_sources/reset_password_remote_data_source.dart';
import '../../request/reset_password_request/reset_password_request.dart';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl
    implements ResetPasswordRemoteDataSource {
  final ApiService apiService;

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

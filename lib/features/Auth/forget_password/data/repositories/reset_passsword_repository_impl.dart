import 'package:injectable/injectable.dart';
import '../../domain/repositories/reset_password_repository.dart';
import '../data_sources/reset_password_remote_data_source.dart';

@Injectable(as: ResetPasswordRepository)
class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  final ResetPasswordRemoteDataSource resetPasswordRemoteDataSource;
  @factoryMethod
  const ResetPasswordRepositoryImpl({
    required this.resetPasswordRemoteDataSource,
  });

  @override
  Future<String?> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    return await resetPasswordRemoteDataSource.resetPassword(
      email: email,
      newPassword: newPassword,
    );
  }
}

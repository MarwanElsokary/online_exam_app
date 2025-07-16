import 'package:injectable/injectable.dart';

import '../../domain/repositories/forgot_password_repository.dart';
import '../data_sources/forgot_password_remote_data_source.dart';

@Injectable(as: ForgetPasswordEmailRepository)
class ForgetPasswordEmailRepositoryImpl
    implements ForgetPasswordEmailRepository {
  final ForgetPasswordEmailRemoteDataSource forgetPasswordEmailRemoteDataSource;

  @factoryMethod
  const ForgetPasswordEmailRepositoryImpl({
    required this.forgetPasswordEmailRemoteDataSource,
  });

  @override
  Future<String?> sendEmailVerification({required String email}) async {
    return await forgetPasswordEmailRemoteDataSource.sendEmailVerification(
      email: email,
    );
  }
}

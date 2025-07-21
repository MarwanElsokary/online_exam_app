import 'package:injectable/injectable.dart';
import '../../domain/repositories/email_verification_repository.dart';
import '../data_sources/email_verification_remote_data_source.dart';

@Injectable(as: EmailVerificationRepository)
class EmailVerificationRepositoryImpl implements EmailVerificationRepository {
  final EmailVerificationRemoteDataSource emailVerificationRemoteDataSource;
  @factoryMethod
  const EmailVerificationRepositoryImpl({
    required this.emailVerificationRemoteDataSource,
  });

  @override
  Future<String?> verifyEmail({required String code}) async {
    return await emailVerificationRemoteDataSource.verifyEmailCode(code: code);
  }
}

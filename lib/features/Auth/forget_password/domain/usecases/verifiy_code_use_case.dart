import 'package:injectable/injectable.dart';
import '../repositories/email_verification_repository.dart';

@injectable
class VerifyEmailUseCase {
  final EmailVerificationRepository _emailVerificationRepository;

  @factoryMethod
  const VerifyEmailUseCase(this._emailVerificationRepository);

  Future<String?> invoke({required String code}) async {
    return await _emailVerificationRepository.verifyEmail(code: code);
  }
}

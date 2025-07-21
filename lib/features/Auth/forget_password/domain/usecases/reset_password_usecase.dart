import 'package:injectable/injectable.dart';

import '../repositories/reset_password_repository.dart';

@injectable
class ResetPasswordUseCase {
  final ResetPasswordRepository _resetPasswordRepository;

  @factoryMethod
  const ResetPasswordUseCase(this._resetPasswordRepository);

  Future<String?> invoke({
    required String email,
    required String newPassword,
  }) async {
    return await _resetPasswordRepository.resetPassword(
      email: email,
      newPassword: newPassword,
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/usecases/reset_password_usecase.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordCubit({required this.resetPasswordUseCase})
    : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoadingState());
    try {
      final response = await resetPasswordUseCase.invoke(
        email: email,
        newPassword: newPassword,
      );
      if (response != null) {
        emit(ResetPasswordSuccessState());
      } else {
        emit(ResetPasswordErrorState("Failed to reset password."));
      }
    } catch (e) {
      emit(ResetPasswordErrorState(e.toString()));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usecases/send_email_verification_use_case.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  final SendEmailVerificationUseCase sendEmailVerificationUseCase;

  ForgetPasswordCubit({required this.sendEmailVerificationUseCase})
      : super(ForgetPasswordInitial());

  Future<void> sendEmailVerification(String email) async {
    emit(ForgetPasswordLoadingState());
    try {
      final response = await sendEmailVerificationUseCase.invoke(email: email);
      if (response != null) {
        emit(ForgetPasswordSuccessState());
      } else {
        emit(ForgetPasswordErrorState("Failed to send verification email."));
      }
    } catch (e) {
      emit(ForgetPasswordErrorState(e.toString()));
    }
  }
}

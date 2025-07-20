part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordSuccessState extends ResetPasswordState {}

class ResetPasswordErrorState extends ResetPasswordState {
  final String errorMessage;

  ResetPasswordErrorState(this.errorMessage);
}

class ResetPasswordLoadingState extends ResetPasswordState {}

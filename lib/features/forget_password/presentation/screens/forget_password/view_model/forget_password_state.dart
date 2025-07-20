part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordSuccessState extends ForgetPasswordState {}

final class ForgetPasswordErrorState extends ForgetPasswordState {
  final String errorMessage;

  ForgetPasswordErrorState(this.errorMessage);
}

final class ForgetPasswordLoadingState extends ForgetPasswordState {}

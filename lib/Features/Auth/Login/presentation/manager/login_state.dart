part of 'login_cubit.dart';

@immutable
sealed class LogINState {}

final class LogINInitial extends LogINState {}

class LogINLoadingState extends LogINState {}

class LogINErrorState extends LogINState {
  String message;

  LogINErrorState(this.message);
}

class LogINSuccessState extends LogINState {
  LogInEntity loginentity;

  LogINSuccessState(this.loginentity);
}

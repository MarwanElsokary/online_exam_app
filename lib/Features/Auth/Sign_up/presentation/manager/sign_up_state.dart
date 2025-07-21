part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
class SignUpLoadingState extends SignUpState{}
class SignUpErrorState extends SignUpState{
  String message;
  SignUpErrorState(this.message);
}
class SignUpSuccessState extends SignUpState{
  SignUpEntity signupentity;
  SignUpSuccessState(this.signupentity);
}
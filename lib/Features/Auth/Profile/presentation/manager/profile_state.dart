part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileIntialstate extends ProfileState {}
class ProfileLoadingState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  String message;

  ProfileErrorState(this.message);
}

class ProfileSuccessState extends ProfileState {
  ProfileEntity profileEntity;

  ProfileSuccessState(this.profileEntity);
}

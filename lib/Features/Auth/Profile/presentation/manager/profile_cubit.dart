import 'package:bloc/bloc.dart';
import 'package:exams/Core/Locale/PrefsHelper.dart';
import 'package:exams/Features/Auth/Profile/domain/entities/ProfileEntity.dart';
import 'package:exams/Features/Auth/Profile/domain/usecase/ProfileUsecase.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final Dio dio;

  ProfileUseCase profileUseCase;

  ProfileCubit(this.profileUseCase, this.dio) : super(ProfileIntialstate());

  profileuser(
      {String? firstname,
      String? secondname,
      String? username,
      String? email,
      String? phone,
      }) async {
    late String? token = PrefsHelper.getToken();
    if (token == null || token.isEmpty) {
      emit(ProfileErrorState("Token not found"));
      return;
    }
    var result = await profileUseCase.call(
        firstname: firstname,
        secondname: secondname,
        username: username,
        email: email,
        phone: phone,
        token: token);
    result.fold((ProfileEntity) {
      print("registeruser success");
      emit(ProfileSuccessState(ProfileEntity));
    }, (error) {
      print("registeruser error: $error");
      emit(ProfileErrorState(error));
    });
  }
}

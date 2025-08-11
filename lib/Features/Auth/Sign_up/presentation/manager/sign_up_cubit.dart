import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/SignUpEntity.dart';
import '../../domain/use_cases/SignUpUseCase.dart';

part 'sign_up_state.dart';
@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final Dio dio;
  SignUpCubit(this.signupusecase,this.dio) : super(SignUpInitial());
  SignUpUseCase signupusecase;
  registeruser({
    required String firstname,
    required String secondname,
    required String username,
    required String email,
    required String phone,
    required String pass,
    required String repass})async{
    print("registeruser called");
    emit(SignUpLoadingState());
    var result=await signupusecase.call(
        firstname: firstname,
        secondname: secondname,
        username: username,
        email: email,
        phone: phone,
        pass: pass,
        repass: repass);
    result.fold((SignUpEntity){
      print("registeruser success");
      emit(SignUpSuccessState(SignUpEntity));
    },(error){
      print("registeruser error: $error");
      emit(SignUpErrorState(error)
      );
    }
    );


  }
}
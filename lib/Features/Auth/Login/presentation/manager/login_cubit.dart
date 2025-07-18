import 'package:bloc/bloc.dart';
import 'package:exams/Features/Auth/Login/data/models/LogInResponse.dart';
import 'package:exams/Features/Auth/Login/domain/entities/LogInEntity.dart';
import 'package:exams/Features/Auth/Login/presentation/pages/Login.dart';

import 'package:exams/Features/Auth/Login/domain/use_cases/LoginUseCase.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
part 'login_state.dart';

@injectable
class LogINCubit extends Cubit<LogINState> {
  final Dio dio;
  LogINCubit(this.loginusecase,this.dio) : super(LogINInitial());
  LoginUseCase loginusecase;

  loginuser({
    required String email,
    required String pass,
  }) async {
    emit(LogINLoadingState());
    var result = await loginusecase.call(
      email: email,
      pass: pass,
    );
    result.fold((LogInEntity) {
      emit(LogINSuccessState(LogInEntity));
    }, (error) {
      emit(LogINErrorState(error));
    });
  }
}

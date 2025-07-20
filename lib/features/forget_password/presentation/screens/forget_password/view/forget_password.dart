import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_one_c3_team/di.dart';
import 'package:project_one_c3_team/features/forget_password/presentation/screens/widget/forget_password_appbar.dart';
import 'package:project_one_c3_team/features/forget_password/presentation/screens/widget/forget_password_body.dart';

import '../../../../domain/usecases/send_email_verification_use_case.dart';
import '../view_model/forget_password_cubit.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late final ForgetPasswordCubit viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<ForgetPasswordCubit>()
      ..sendEmailVerificationUseCase = getIt<SendEmailVerificationUseCase>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgetPasswordCubit(
        sendEmailVerificationUseCase: context
            .read<SendEmailVerificationUseCase>(),
      ),
      child: Scaffold(
        appBar: ForgetPasswordAppbar(),
        body: ForgetPasswordBody(),
      ),
    );
  }
}

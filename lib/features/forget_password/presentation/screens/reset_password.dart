import 'package:flutter/material.dart';
import 'package:project_one_c3_team/features/forget_password/presentation/screens/widget/forget_password_appbar.dart';
import 'package:project_one_c3_team/features/forget_password/presentation/screens/widget/reset_password_body.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ForgetPasswordAppbar(),
      body: ResetPasswordBody()
    );
  }
}

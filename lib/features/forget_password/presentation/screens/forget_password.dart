import 'package:flutter/material.dart';
import 'package:project_one_c3_team/features/forget_password/presentation/screens/widget/forget_password_appbar.dart';
import 'package:project_one_c3_team/features/forget_password/presentation/screens/widget/forget_password_body.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ForgetPasswordAppbar(),
      body: ForgetPasswordBody(),
    );
  }
}

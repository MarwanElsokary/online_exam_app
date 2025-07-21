import 'package:flutter/material.dart';

import '../../widget/forget_password_appbar.dart';
import '../../widget/reset_password_body.dart';

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

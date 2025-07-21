import 'package:flutter/material.dart';

import '../widget/forget_password_appbar.dart';
import '../widget/verification_code_body.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ForgetPasswordAppbar(),
      body: VerificationCodeBody(),
    );
  }
}

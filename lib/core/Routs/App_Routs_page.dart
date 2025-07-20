import 'package:flutter/material.dart';
import 'package:project_one_c3_team/features/forget_password/presentation/screens/forget_password/view/forget_password.dart';
import '../../features/forget_password/presentation/screens/reset_password/view/reset_password.dart';
import '../../features/forget_password/presentation/screens/verification_code/verification_code.dart';
import '../../login_Screen/login_screen.dart';
import '../../singUp/signup.dart';
import 'App_Routs_names.dart';

interface class AppRoutsPage {
  static Route route(RouteSettings settings) {
    switch (settings.name) {
      case App_Routs_names.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case App_Routs_names.signUpScreen:
        return MaterialPageRoute(builder: (context) => const signUp());

      case App_Routs_names.forgetPasswordScreen:
        return MaterialPageRoute(builder: (context) => const ForgetPassword());

      case App_Routs_names.verificationCode:
        return MaterialPageRoute(
          builder: (context) => const VerificationCode(),
        );
      case App_Routs_names.resetPassword:
        return MaterialPageRoute(builder: (context) => const ResetPassword());

      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}

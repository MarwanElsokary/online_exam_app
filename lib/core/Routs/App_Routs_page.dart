import 'package:flutter/material.dart';
import 'package:online_exam/Features/Exam/presentation/pages/Exam_Page.dart';
import '../../Features/Auth/Login/presentation/pages/Login.dart';
import '../../Features/Auth/Sign_up/presentation/pages/sign_up screen.dart';
import '../../Features/Home/presentation/pages/Home_Page.dart';
import '../../Features/Home/presentation/widgets/examdetailedscreen.dart';
import '../../Features/Home/presentation/widgets/subsubjectspage.dart';
import '../../Features/Auth/forget_password/presentation/screens/forget_password/view/forget_password.dart';
import '../../Features/Auth/forget_password/presentation/screens/reset_password/view/reset_password.dart';
import '../../Features/Auth/forget_password/presentation/screens/verification_code/verification_code.dart';
import 'package:online_exam/Core/Remote/response/responses/exam_response.dart'as examResponse;
import 'App_Routs_names.dart';

interface class AppRoutsPage {
  late examResponse.Exam exam;
  static Route <dynamic>route(RouteSettings settings) {
    switch (settings.name) {
      case App_Routs_names.Login:
        return MaterialPageRoute(builder: (context) => Login());

      case App_Routs_names.signUpScreen:
        return MaterialPageRoute(builder: (context) => Signup());

      case App_Routs_names.forgetPasswordScreen:
        return MaterialPageRoute(builder: (context) => const ForgetPassword());

      case App_Routs_names.verificationCode:
        return MaterialPageRoute(
          builder: (context) => const VerificationCode(),
        );
      case App_Routs_names.resetPassword:
        return MaterialPageRoute(builder: (context) => const ResetPassword());

      case App_Routs_names.mainRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case App_Routs_names.SubSubjectsRoute:
        return MaterialPageRoute(builder: (_) => SubSubjectscreen());
      case App_Routs_names.ExamRoute:
        return MaterialPageRoute(builder: (_){
          final examResponse.Exam exam = settings.arguments as examResponse.Exam;
          return ExamPage(exam: exam);
        }

        );

      case App_Routs_names.examdetailsRoute:
        return MaterialPageRoute(builder: (_){
           final examResponse.Exam exam = settings.arguments as examResponse.Exam;
          return examdetailedscreen(exam: exam);
        }

        );
      // case Routes.profileRoute:
      //   return MaterialPageRoute(builder: (_) => Profile());

      default:
        return MaterialPageRoute(builder: (context) => Login());
    }
  }
}

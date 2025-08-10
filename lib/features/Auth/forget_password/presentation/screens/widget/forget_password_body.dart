import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/utils/app_color.dart';
import '../../../../../../Core/utils/app_text.dart';
import '../../../../../../Core/utils/font_manager.dart';
import '../../../../../../Core/utils/values_manager.dart';
import '../forget_password/view_model/forget_password_cubit.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordBody> {
  TextEditingController emailController = TextEditingController();
  bool isEmailValid = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        isEmailValid = RegExp(
          r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
        ).hasMatch(emailController.text.trim());
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.s14,
            vertical: AppSize.s24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  AppText.forgetPassword,
                  style: TextStyle(
                    fontWeight: FontWeightManager.medium,
                    fontSize: AppSize.s18,
                  ),
                ),
              ),
              SizedBox(height: AppSize.s20),
              Text(
                AppText.forgetPasswordMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.gray,
                  fontWeight: FontWeightManager.regular,
                  fontSize: AppSize.s18,
                ),
              ),
              SizedBox(height: AppSize.s20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: AppText.email,
                  hintText: AppText.enterYourEmail,
                  border: OutlineInputBorder(),
                  errorText: emailController.text.isNotEmpty && !isEmailValid
                      ? AppText.thisEmailIsNotValid
                      : null,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: AppSize.s20),
              ElevatedButton(
                onPressed: isEmailValid
                    ? () {
                        Navigator.pushNamed(context, '/verificationCode');
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isEmailValid
                      ? AppColors.primary
                      : AppColors.gray,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  AppText.continueText,
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is ForgetPasswordSuccessState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(AppText.emailVerification)));
          Navigator.pushNamed(context, '/verificationCode');
        } else if (state is ForgetPasswordErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
    );
  }
}

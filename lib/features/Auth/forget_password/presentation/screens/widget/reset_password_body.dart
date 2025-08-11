import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/DI/DI.dart';
import '../../../../../../Core/utils/app_color.dart';
import '../../../../../../Core/utils/app_text.dart';
import '../../../../../../Core/utils/font_manager.dart';
import '../../../../../../Core/utils/values_manager.dart';
import '../../../../Login/presentation/pages/Login.dart';
import '../../../../login_Screen/login_screen.dart';
import '../reset_password/view_model/reset_password_cubit.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordValid = false;
  bool isConfirmPasswordMatched = false;

  @override
  void initState() {
    super.initState();
    newPasswordController.addListener(validatePasswords);
    confirmPasswordController.addListener(validatePasswords);
  }

  void validatePasswords() {
    setState(() {
      final newPassword = newPasswordController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();

      isPasswordValid = RegExp(
        r'^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{6,}$',
      ).hasMatch(newPassword);
      isConfirmPasswordMatched = newPassword == confirmPassword;
    });
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s16,
        vertical: AppSize.s24,
      ),
      child: BlocProvider(
        create: (context) => ResetPasswordCubit(resetPasswordUseCase: getIt()),
        child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    AppText.resetPassword,
                    style: TextStyle(
                      fontWeight: FontWeightManager.medium,
                      fontSize: AppSize.s18,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s20),
                Text(
                  AppText.resetPasswordMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.gray,
                    fontWeight: FontWeightManager.regular,
                    fontSize: AppSize.s18,
                  ),
                ),
                SizedBox(height: AppSize.s20),

                // New password field
                TextField(
                  controller: newPasswordController,
                  decoration: InputDecoration(
                    labelText: AppText.newPassword,
                    hintText: AppText.enterYourPassword,
                    border: OutlineInputBorder(),
                    errorText: newPasswordController.text.isNotEmpty &&
                            !isPasswordValid
                        ? AppText.hintCorrectPassword
                        : null,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: AppSize.s20),

                // Confirm password field
                TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: AppText.confirmPassword,
                    hintText: AppText.confirmPassword,
                    border: OutlineInputBorder(),
                    errorText: confirmPasswordController.text.isNotEmpty &&
                            !isConfirmPasswordMatched
                        ? AppText.passwordsDoNotMatch
                        : null,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: AppSize.s20),

                ElevatedButton(
                  onPressed: isPasswordValid && isConfirmPasswordMatched
                      ? () {
                          MaterialPageRoute(builder: (_) => Login());
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPasswordValid && isConfirmPasswordMatched
                        ? AppColors.primary
                        : AppColors.red,
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
            );
          },
          listener: (context, state) {
            if (state is ResetPasswordSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppText.resetPasswordMessage)),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => Login()),
              );
            } else if (state is ResetPasswordErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          buildWhen: (previous, current) {
            return current is ResetPasswordLoadingState ||
                current is ResetPasswordInitial ||
                current is ResetPasswordSuccessState;
          },
          listenWhen: (previous, current) {
            return current is ResetPasswordSuccessState ||
                current is ResetPasswordErrorState;
          },
        ),
      ),
    );
  }
}

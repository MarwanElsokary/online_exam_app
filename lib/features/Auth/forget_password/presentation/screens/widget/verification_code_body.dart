import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_text.dart';
import '../../../../../../core/utils/font_manager.dart';
import '../../../../../../core/utils/values_manager.dart';
import '../reset_password/view/reset_password.dart';

class VerificationCodeBody extends StatelessWidget {
  const VerificationCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.s20),
            Center(
              child: Text(
                AppText.emailVerification,
                style: TextStyle(
                  fontWeight: FontWeightManager.medium,
                  fontSize: AppSize.s18,
                ),
              ),
            ),
            SizedBox(height: AppSize.s20),
            Text(
              AppText.emailVerificationMessage2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.gray,
                fontWeight: FontWeightManager.regular,
                fontSize: AppSize.s18,
              ),
            ),
            SizedBox(height: AppSize.s40),
            PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: false,

              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 68,
                fieldWidth: 75,
                activeFillColor: AppColors.white,
                inactiveFillColor: AppColors.lightGray,
                selectedColor: AppColors.white,
                activeColor: AppColors.white,
                inactiveColor: AppColors.white,
              ),
              animationDuration: Duration(milliseconds: 12),
              enableActiveFill: true,
              onCompleted: (value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ResetPassword()),
                );
              },
            ),

            SizedBox(height: AppSize.s20),
            Text.rich(
              TextSpan(
                text: AppText.didntReceiveCode,
                style: TextStyle(fontSize: AppSize.s16, color: AppColors.gray),
                children: [
                  TextSpan(
                    text: AppText.resend,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeightManager.medium,
                    ),
                  ),
                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

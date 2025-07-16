import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_text.dart';
import '../../../../../core/utils/font_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class ForgetPasswordAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: Text(
        AppText.password,
        style: TextStyle(
          fontSize: AppSize.s20,
          fontWeight: FontWeightManager.medium,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_outlined, size: AppSize.s20),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:online_exam/Features/Home/presentation/pages/Home_Page.dart';
import 'Core/DI/DI.dart';
import 'Core/Locale/PrefsHelper.dart';
import 'Core/Resources/bloc observer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/Routs/App_Routs_names.dart';
import 'core/Routs/App_Routs_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();

  await PrefsHelper.init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: PrefsHelper.getToken() != null
              ? App_Routs_names.mainRoute
              : App_Routs_names.signUpScreen,
          onGenerateRoute: AppRoutsPage.route,
        );
      },
    );
  }
}

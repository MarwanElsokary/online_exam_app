import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/Features/Auth/Login/presentation/pages/Login.dart';
import 'package:online_exam/Features/Auth/Sign_up/presentation/pages/sign_up%20screen.dart';
import 'package:online_exam/Features/Home/home.dart';
import 'package:online_exam/Features/Home/presentation/pages/Home_Page.dart';
import 'Core/DI/DI.dart';
import 'Core/Locale/PrefsHelper.dart';
import 'Core/Resources/bloc observer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/Routs/App_Routs_names.dart';
import 'core/Routs/App_Routs_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: App_Routs_names.loginScreen,
          onGenerateRoute: AppRoutsPage.route,
        );
      },
    );
  }
}

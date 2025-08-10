import 'package:exams/Core/DI/DI.dart';
import 'package:exams/Core/Locale/PrefsHelper.dart';
import 'package:exams/Core/RoutesManager/Routs%20Generator.dart';
import 'package:exams/Core/RoutesManager/routes.dart';
import 'package:exams/Features/Auth/Login/presentation/pages/Login.dart';
import 'package:exams/Features/Auth/Sign_up/presentation/pages/sign_up%20screen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await PrefsHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: Routes.signInRoute, // أو أي صفحة تبدأ منها
      onGenerateRoute: RouteGenerator.getRoute,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Login(),
    );
  }
}


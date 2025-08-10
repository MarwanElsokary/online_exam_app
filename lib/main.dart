import 'package:bloc/bloc.dart';
import 'package:exams/Features/Auth/Login/presentation/pages/Login.dart';
import 'package:exams/Features/Auth/Sign_up/presentation/pages/sign_up%20screen.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/Core/RoutesManager/Routs%20Generator.dart';
import 'package:online_exam/Core/RoutesManager/routes.dart';
import 'package:online_exam/Features/Auth/Login/presentation/pages/Login.dart';
import 'package:online_exam/Features/Auth/Sign_up/presentation/pages/sign_up%20screen.dart';
import 'package:online_exam/Features/Exam/presentation/pages/Exam_Page.dart';
import 'package:online_exam/Features/Exam/presentation/pages/resultPage.dart';
import 'package:online_exam/Features/Home/presentation/pages/Home_Page.dart';
import 'package:online_exam/Features/Home/presentation/widgets/subsubjectspage.dart';

import 'Core/DI/DI.dart';
import 'Core/Locale/PrefsHelper.dart';
import 'Core/Resources/bloc observer.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Login(),
    );
  }
}


        builder: (context, child) => MaterialApp(
              home: child,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: PrefsHelper.getToken() != null
                  ? Routes.signInRoute
                  : Routes.signUpRoute,
            ));
  }
}
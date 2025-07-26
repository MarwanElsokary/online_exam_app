import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/Features/Auth/Sign_up/presentation/pages/sign_up%20screen.dart';

import 'Core/DI/di.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Signup());
  }
}

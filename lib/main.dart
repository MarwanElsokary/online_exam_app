import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/Features/Auth/Login/presentation/pages/Login.dart';
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
      home: Login(),
    );
  }
}

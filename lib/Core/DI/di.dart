import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';
// This file is used to configure dependency injection using GetIt and Injectable.
// It initializes the GetIt instance and provides a Dio instance for making HTTP requests.
// It also includes the necessary annotations and configurations for the Injectable package.
// The `configureDependencies` function is called to set up the dependencies in the application.
// The `provideDio` function is annotated with `@lazySingleton` to ensure that a single instance of Dio is created and reused throughout the application.


final getIt = GetIt.instance;

@lazySingleton
Dio provideDio() => Dio();

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

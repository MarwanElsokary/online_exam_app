import 'package:exams/Core/DI/DI.dart';
import 'package:exams/Core/Locale/PrefsHelper.dart';
import 'package:exams/Core/RoutesManager/routes.dart';
import 'package:exams/Features/Auth/Login/presentation/manager/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exams/Features/Auth/Sign_up/presentation/Widgets/CustomTextField.dart';
import 'package:exams/Features/Auth/Sign_up/presentation/pages/sign_up%20screen.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const String routeName = "Login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailcontroller;
  late TextEditingController passcontroller;
  late final LogINCubit viewModel;

  @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController();
    passcontroller = TextEditingController();
    viewModel = getIt<LogINCubit>();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              "Login",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  CustomTextField(
                    hintText: "Email",
                    isPassword: false,
                    lableText: "Email",
                    controller: emailcontroller,
                    validator: (String? val) {
                      RegExp emailRegex = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      );
                      if (val == null || val.trim().isEmpty) {
                        return 'This field is required';
                      } else if (!emailRegex.hasMatch(val)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: "Password",
                    isPassword: true,
                    lableText: "Password",
                    controller: passcontroller,
                    validator: (String? val) {
                      RegExp passwordRegex =
                          RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
                      if (val == null || val.isEmpty) {
                        return 'This field is required';
                      } else if (val.length < 8 ||
                          !passwordRegex.hasMatch(val)) {
                        return 'Strong password please';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(

                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: (){

                    },
                    child: BlocConsumer<LogINCubit, LogINState>(
                      listener: (context, state) {
                        if (state is LogINLoadingState) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            ),
                          );
                        } else {
                          // إغلاق أي Dialog مفتوح
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        }

                        if (state is LogINErrorState) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text(state.message),
                            ),
                          );
                        } else if (state is LogINSuccessState) {
                          print("Success state reached!");
                          PrefsHelper.saveToken(state.loginentity.token!);
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Navigator.pushReplacementNamed(
                                context, Routes.profileRoute);
                          });
                        }
                      },
                      builder: (context, state) {
                        var cubit = BlocProvider.of<LogINCubit>(context);
                        return ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              cubit.loginuser(
                                email: emailcontroller.text,
                                pass: passcontroller.text,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.all(20.0),
                            fixedSize: Size(300, 60),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Signup.routename);
                        },
                        child: Text(
                          " Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

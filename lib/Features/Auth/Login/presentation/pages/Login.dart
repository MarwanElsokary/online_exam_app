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
    super.dispose();
    emailcontroller.dispose();
    passcontroller.dispose();
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
            centerTitle: false,
            leading:
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
            title: Text(
              "Login",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: CustomTextField(
                  hintText: "Email",
                  isPassword: false,
                  lableText: "Email",
                  controller: emailcontroller,
                  validator: (String? val) {
                    RegExp emailRegex = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if (val == null) {
                      return 'this field is required';
                    } else if (val.trim().isEmpty) {
                      return 'this field is required';
                    } else if (emailRegex.hasMatch(val) == false) {
                      return 'enter valid email';
                    } else {
                      return val.isEmpty ? "Email can't be empty" : null;
                    }
                  }),
            ),
            Container(
              width: double.infinity,
              child: CustomTextField(
                  hintText: "Password",
                  isPassword: true,
                  lableText: "Password",
                  controller: passcontroller,
                  validator: (String? val) {
                    RegExp passwordRegex =
                        RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
                    if (val == null) {
                      return 'this field is required';
                    } else if (val.isEmpty) {
                      return 'this field is required';
                    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
                      return 'strong password please';
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Forget Password",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BlocConsumer<LogINCubit, LogINState>(
              listener: (context, state) {
                if (state is LogINLoadingState) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Center(
                              child: CircularProgressIndicator(
                                  color: Colors.black),
                            ),
                          ));
                } else if (state is LogINErrorState) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(state.message),
                                ],
                              ),
                            ),
                          ));
                } else if (state is LogINSuccessState) {
                  PrefsHelper.SaveToken(state.loginentity.token!);
                  Navigator.pushReplacementNamed(context, Routes.homeRoute);
                }
              },
              builder: (context, state) {
                var cubit = BlocProvider.of<LogINCubit>(context);
                return ElevatedButton(
                  onPressed: () {

                    if (formkey.currentState!.validate()) {

                      cubit.loginuser(
                          email:  emailcontroller.text
                          , pass: passcontroller.text,);

                    }
                  },
                  child: Text("SignUp", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(color: Colors.white),
                    padding: EdgeInsets.all(20.0),
                    fixedSize: Size(300, 60),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    "Dont have an account?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Signup.routename);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

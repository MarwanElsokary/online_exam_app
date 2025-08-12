import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/Core/DI/di.dart';
import 'package:online_exam/Core/Locale/PrefsHelper.dart';
import 'package:online_exam/Core/Widgets/CustomTextField.dart';
import 'package:online_exam/Features/Auth/Login/presentation/pages/Login.dart';
import 'package:online_exam/Features/Auth/Sign_up/presentation/manager/sign_up_cubit.dart';

import '../../../../../core/Routs/App_Routs_names.dart';

class Signup extends StatefulWidget {
  static const String routename = "SignUp";

  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late TextEditingController usercontroller;

  late TextEditingController firstcontroller;

  late TextEditingController secondcontroller;

  late TextEditingController emailcontroller;

  late TextEditingController passcontroller;

  late TextEditingController confirmcontroller;

  late TextEditingController phonecontroller;

  late final SignUpCubit viewModel;

  @override
  void initState() {
    super.initState();
    usercontroller = TextEditingController();
    firstcontroller = TextEditingController();
    secondcontroller = TextEditingController();
    emailcontroller = TextEditingController();
    phonecontroller = TextEditingController();
    passcontroller = TextEditingController();
    confirmcontroller = TextEditingController();
    viewModel = getIt<SignUpCubit>();
  }

  @override
  void dispose() {
    super.dispose();
    usercontroller.dispose();
    firstcontroller.dispose();
    secondcontroller.dispose();
    emailcontroller.dispose();
    phonecontroller.dispose();
    passcontroller.dispose();
    confirmcontroller.dispose();
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, App_Routs_names.Login);
                },
                icon: Icon(Icons.arrow_back_ios)),
            title: Text(
              "Sign Up",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )),
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: CustomTextField(
                    hintText: "Enter Username",
                    isPassword: false,
                    lableText: "UserName",
                    controller: usercontroller,
                    validator: (String? val) {
                      //RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
                      if (val == null) {
                        return 'this field is required';
                      } else if (val.isEmpty) {
                        return 'this field is required';
                      } //else if (!usernameRegex.hasMatch(val)) {
                      // return 'enter valid username';}
                      else {
                        return null;
                      }
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                          hintText: "First Name",
                          isPassword: false,
                          lableText: "First Name",
                          controller: firstcontroller,
                          validator: (String? val) {
                            if (val == null || val.isEmpty) {
                              return 'this field is required';
                            } else {
                              return null;
                            }
                          }),
                    ),
                    Expanded(
                      child: CustomTextField(
                        hintText: "Enter Second Name",
                        isPassword: false,
                        lableText: "Second Name",
                        controller: secondcontroller,
                        validator: (String? val) {
                          if (val == null || val.isEmpty) {
                            return 'this field is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
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
                Row(children: [
                  Expanded(
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
                          } else if (val.length < 8 ||
                              !passwordRegex.hasMatch(val)) {
                            return 'strong password please';
                          } else {
                            return null;
                          }
                        }),
                  ),
                  Expanded(
                    child: CustomTextField(
                        hintText: "Confirm Password",
                        isPassword: true,
                        lableText: "Confirm Password",
                        controller: confirmcontroller,
                        validator: (String? val) {
                          if (val == null || val.isEmpty) {
                            return 'this field is required';
                          } else {
                            return null;
                          }
                        }),
                  ),
                ]),
                SizedBox(
                  width: double.infinity,
                  child: CustomTextField(
                      hintText: "phone number",
                      isPassword: false,
                      lableText: "Phone Number",
                      controller: phonecontroller,
                      validator: (String? val) {
                        if (val == null) {
                          return 'this field is required';
                        } else if (int.tryParse(val.trim()) == null) {
                          return 'enter numbers only';
                        } else if (val.trim().length != 11) {
                          return 'enter value must equal 11 digit';
                        } else {
                          return null;
                        }
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                BlocConsumer<SignUpCubit, SignUpState>(
                  listener: (context, state) {
                    if (state is SignUpLoadingState) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.black),
                                ),
                              ));
                      Navigator.pop(context);
                    } else if (state is SignUpErrorState) {
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
                      Navigator.pop(context);
                    } else if (state is SignUpSuccessState) {
                      PrefsHelper.SaveToken(state.signupentity.token!);

                    }
                  },
                  builder: (context, state) {
                    var cubit = BlocProvider.of<SignUpCubit>(context);
                    return ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          cubit.registeruser(
                              firstname: firstcontroller.text,
                              secondname: secondcontroller.text,
                              username: usercontroller.text,
                              email: emailcontroller.text,
                              phone: phonecontroller.text,
                              pass: passcontroller.text,
                              repass: confirmcontroller.text);
                          Navigator.pushReplacementNamed(
                              context, App_Routs_names.mainRoute);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        textStyle: TextStyle(color: Colors.white),
                        padding: EdgeInsets.all(20.0),
                        fixedSize: Size(300, 60),
                      ),
                      child:
                          Text("SignUp", style: TextStyle(color: Colors.white)),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => Login()),
                            (route) => false, // يمسح كل الشاشات السابقة
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:exams/Core/DI/DI.dart';
import 'package:exams/Core/Locale/PrefsHelper.dart';
import 'package:exams/Core/RoutesManager/routes.dart';
import 'package:exams/Features/Auth/Profile/presentation/manager/profile_cubit.dart';
import 'package:exams/Features/Auth/Sign_up/presentation/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatefulWidget {
  static const String routename = "/profile";

  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController usercontroller;

  late TextEditingController firstcontroller;

  late TextEditingController secondcontroller;

  late TextEditingController emailcontroller;

  late TextEditingController confirmcontroller;

  late TextEditingController phonecontroller;
  late final ProfileCubit viewModel;
  late var userData;

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    usercontroller = TextEditingController();
    firstcontroller = TextEditingController();
    secondcontroller = TextEditingController();
    emailcontroller = TextEditingController();
    phonecontroller = TextEditingController();
    confirmcontroller = TextEditingController();
    viewModel = getIt<ProfileCubit>();
    userData=viewModel.profileuser();

  }


  @override
  void dispose() {
    super.dispose();
    usercontroller.dispose();
    firstcontroller.dispose();
    secondcontroller.dispose();
    emailcontroller.dispose();
    phonecontroller.dispose();
    confirmcontroller.dispose();
  }


  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
          title: Text(
            "Profile",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Container(
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
                        return val.isEmpty ? "username can't be empty" : " ";
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
                BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    if (state is ProfileLoadingState) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Center(
                              child: CircularProgressIndicator(
                                  color: Colors.black),
                            ),
                          ));
                    } else if (state is ProfileErrorState) {
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
                    } else if (state is ProfileSuccessState) {
                      PrefsHelper.saveToken(state.profileEntity.token!);
                      Navigator.pushReplacementNamed(context, Routes.homeRoute);
                    }
                  },
                  builder: (context, state) {
                    var cubit = BlocProvider.of<ProfileCubit>(context);
                    return ElevatedButton(
                      onPressed: () {
                        print("Button Pressed");
                        if (formkey.currentState!.validate()) {
                          print("Form is valid");
                          cubit.profileUseCase(
                              firstname: firstcontroller.text,
                              secondname: secondcontroller.text,
                              username: usercontroller.text,
                              email: emailcontroller.text,
                              phone: phonecontroller.text,
                            token: "omar"
                          );
                        }
                        print("First Name: ${firstcontroller.text}");
                      },
                      child:
                      Text("Update", style: TextStyle(color: Colors.white)),
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
                  height: 10,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

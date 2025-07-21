import 'package:flutter/material.dart';
import 'package:online_exam/Core/Widgets/CustomTextField.dart';
import 'package:online_exam/Features/Auth/Sign_up/presentation/pages/sign_up%20screen.dart';

class Login extends StatelessWidget{
  static const String routeName="Login";
  late TextEditingController emailcontroller = TextEditingController();
  late TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          centerTitle: false,
          leading: IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back_ios)),
          title: Text(
            "Login",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          )),
      body: Column(
        children: [
          Container(
            width:double.infinity ,
            child: CustomTextField(
                hintText: "Email",
                isPassword: false,
                lableText: "Email",
                controller:emailcontroller,
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
                }
            ),
          ),
          Container(
            width:double.infinity ,
            child: CustomTextField(
                hintText: "Password",
                isPassword: true,
                lableText: "Password",
                controller:passcontroller,
                validator: (String? val) {
                  RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
                  if (val == null) {
                    return 'this field is required';
                  } else if (val.isEmpty) {
                    return 'this field is required';
                  } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
                    return 'strong password please';
                  } else {
                    return null;
                  }
                }
            ),
          ),
          SizedBox( height: 5,),
          Text(
            "Forget Password",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500,),
          ),
          SizedBox( height: 10,),
          ElevatedButton(onPressed: (){
            // Navigator.push(context,MaterialPageRoute(builder: (context) =>));

          },
            child: Text("Login",style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              textStyle: TextStyle(color: Colors.white),
              padding: EdgeInsets.all(20.0),
              fixedSize: Size(300, 60),
            ),),
          SizedBox(height: 20,),
          Center(
            child: Row(
              children: [
                Text("Dont have an account?",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
                InkWell(onTap:(){Navigator.pushReplacementNamed(context,Signup.routename);},
                    child: Text("Sign Up",style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.w400),)),
              ],
            ),
          )
        ],
      ),
    ));
  }

}
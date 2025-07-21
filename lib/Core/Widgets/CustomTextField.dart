import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{
  final String hintText;
  final String lableText;
  final bool isPassword;



  final TextEditingController? controller;
  final String? Function(String?)? validator;
   CustomTextField({
    required this.hintText,
     required this.isPassword,
     required this.controller,
     this.validator,
     required this.lableText

  });
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 20 ),
        child: TextFormField(
controller: controller,
          validator: validator,
          decoration: InputDecoration(
            labelText:lableText,
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey,width: 0.5)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff898F9C),width: 0.5),
              borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff898F9C),width: 0.5),
              borderRadius: BorderRadius.circular(5),

            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width:0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
          ),

        ),
    );
  }

}
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget{
  final String hintText;
  final TextEditingController? searchcontroller;
  final Icon ? icon;

  const SearchTextField({super.key, 

    required this.hintText,
    required this.searchcontroller,
    required this.icon

  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20 ),
      child: TextFormField(

        controller: searchcontroller,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: Colors.grey,width: 0.5)
          ),
        ),

      ),
    );
  }

}
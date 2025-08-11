

import 'package:flutter/material.dart';
import 'package:online_exam/Core/Remote/response/responses/questions_response.dart';
import 'package:online_exam/Core/Resources/ColorsManager.dart';

class QuesstionWidget extends StatefulWidget{
  Answers? title;
  QuesstionWidget({ required this.title});

  @override
  State<QuesstionWidget> createState() => _QuesstionWidgetState();
}

class _QuesstionWidgetState extends State<QuesstionWidget> {
  bool isSelected = false;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        setState(() {
          isSelected=!isSelected;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: (){}, icon:isSelected?Icon(Icons.circle,color: ColorsManager.secondaryColor,) :Icon(Icons.circle_outlined,color: ColorsManager.secondaryColor,)),
                SizedBox(width: 5,),
                Text(
                 widget.title.toString()??" ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
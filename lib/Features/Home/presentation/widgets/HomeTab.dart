import 'package:flutter/material.dart';
import 'package:online_exam/Core/Resources/ColorsManager.dart';
import 'package:online_exam/Core/Resources/stringsManager.dart';
import 'package:online_exam/Core/Widgets/SearchTextField.dart';
import 'package:online_exam/Core/Widgets/SubjectWidget.dart';

class HomeTab extends StatelessWidget {
   HomeTab({super.key});
  final TextEditingController? searchcontroller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: false,
        title: Text(StringsManager.survey,style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: ColorsManager.secondaryColor
        )),
        ),
      body:Column(
        children: [
          SearchTextField(hintText: "Search", searchcontroller: searchcontroller, icon: Icon(Icons.search)),
          const SizedBox(height: 15,),
          Text(StringsManager.Browsebysubject,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: ColorsManager.tretaryColor
          )),
          const SizedBox(height: 15,),
          Expanded(child: ListView.builder(itemBuilder: (context,index)=>Subjectwidget(icon:Icon(Icons.insert_emoticon_sharp),
              subjectname:"Subject ${index+1}"),itemCount: 4,))
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:online_exam/Core/Resources/stringsManager.dart';
import 'package:online_exam/Core/Widgets/SubSubjectWidget.dart';

class SubSubjectscreen extends StatelessWidget{
  const SubSubjectscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sub Subjects"),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: 10, // Example count
        itemBuilder: (context, index) =>SubSubjectWidget(
            subSubjectName: StringsManager.Highlevel
            , subSubjectDescription:StringsManager.describtion
            , questionCount:StringsManager.numques , timer:StringsManager.timer )


        ,
      ),
    );
  }
}
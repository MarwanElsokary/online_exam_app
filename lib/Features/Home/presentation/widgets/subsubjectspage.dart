import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/Core/DI/DI.dart';
import 'package:online_exam/Core/Resources/stringsManager.dart';
import 'package:online_exam/Core/Widgets/SubSubjectWidget.dart';
import 'package:online_exam/Features/Home/domain/model/exams.dart';
import 'package:online_exam/Features/Home/presentation/Manager/subsubject_cubit.dart';

class SubSubjectscreen extends StatelessWidget{
  List<Exams>exams=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text("Sub Subjects"),
        centerTitle: false,
      ),
      body: BlocProvider(
  create: (context) => getIt<SubsubjectCubit>()..getallexams(),
  child: BlocBuilder<SubsubjectCubit, SubsubjectState>(
    buildWhen: (previous,current){
      if(current is SubsubjectsLoadingState||
          current is SubsubjectsErrorState||
          current is SubsubjectsSuccesState
      )
        {return true;}
      return false;
    },
  builder: (context, state) {
      if (state is SubsubjectsLoadingState){
        return Center(child: CircularProgressIndicator());
      }
      if (state is SubsubjectsErrorState){
        return Center(child: Text(state.error));
      }
      if (state is SubsubjectsSuccesState){
        exams=state.exams as List<Exams>;

      }
      return ListView.builder(
        itemCount: 10, // Example count
        itemBuilder: (context, index) =>SubSubjectWidget(
            subSubjectName: exams[index].title
            , subSubjectDescription:exams[index].subject
            , questionCount:exams[index].numberOfQuestions , timer:exams[index].duration )


        ,
      );
      //else return ;

  },
),
),
    );
  }
}
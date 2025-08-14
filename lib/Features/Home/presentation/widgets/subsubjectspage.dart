import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/Core/DI/DI.dart';
import 'package:online_exam/Core/Resources/stringsManager.dart';
import 'package:online_exam/Core/Widgets/SubSubjectWidget.dart';
import 'package:online_exam/Features/Home/domain/model/exams.dart';
import 'package:online_exam/Features/Home/presentation/Manager/subsubject_cubit.dart';

import '../../../../Core/Remote/response/responses/exam_response.dart';
import '../../../../Core/Routs/App_Routs_names.dart';

class SubSubjectscreen extends StatelessWidget {
  List<Exam> exams = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, App_Routs_names.mainRoute);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text("Sub Subjects"),
        centerTitle: false,
      ),
      body: BlocProvider(
        create: (context) => getIt<SubsubjectCubit>()..getallexams(),
        child: BlocBuilder<SubsubjectCubit, SubsubjectState>(
          buildWhen: (previous, current) {
            if (current is SubsubjectsLoadingState ||
                current is SubsubjectsErrorState ||
                current is SubsubjectsSuccesState) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            if (state is SubsubjectsLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is SubsubjectsErrorState) {
              return Center(child: Text(state.error));
            }
            if (state is SubsubjectsSuccesState) {
              exams = state.exams;
            }
            return ListView.builder(
              itemCount: exams.length, // Example count
              itemBuilder: (context, index) => SubSubjectWidget(
                 exam: exams[index],

              ),
            );
            //else return ;
          },
        ),
      ),
    );
  }
}

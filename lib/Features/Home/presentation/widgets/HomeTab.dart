import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/Core/DI/DI.dart';
import 'package:online_exam/Core/Remote/response/responses/subject_response.dart';
import 'package:online_exam/Core/Resources/ColorsManager.dart';
import 'package:online_exam/Core/Resources/stringsManager.dart';
import 'package:online_exam/Core/Widgets/SearchTextField.dart';
import 'package:online_exam/Core/Widgets/SubjectWidget.dart';
import 'package:online_exam/Features/Home/presentation/Manager/subjects_cubit.dart';

class HomeTab extends StatelessWidget {

  final TextEditingController? searchcontroller = TextEditingController();
  List<Subjects> subjects = [];

  HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(StringsManager.survey,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.secondaryColor)),
        ),
        body: Column(
          children: [
            SearchTextField(
                hintText: "Search",
                searchcontroller: searchcontroller,
                icon: Icon(Icons.search)),
            const SizedBox(
              height: 15,
            ),
            Text(StringsManager.Browsebysubject,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.tretaryColor)),
            const SizedBox(
              height: 15,
            ),
            BlocProvider(
              create: (context) =>
              getIt<SubjectsCubit>()
                ..getAllSubjects(),
              child: BlocBuilder<SubjectsCubit, SubjectsState>(
                buildWhen: (previous, current) {
                   if(current is SubjectsSuccesState ||
                       current is SubjectsLoadingState||current is SubjectsErrorState)
                    { return true;}
                   return false;}


                ,builder: (context, state) {
                  if  (state is SubjectsLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is SubjectsErrorState) {
                    return Center(child: Text(state.error));
                  }
                  if (state is SubjectsSuccesState) {
                    subjects = state.subjects as List<Subjects>;
                  }
                  return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            Subjectwidget(
                              icon: Icon(
                                  (subjects[index].icon ??
                                      Icons.add) as IconData?),
                              id: subjects[index].Id ?? '',


                              subjectname: subjects[index].name ?? " ",),
                        itemCount: subjects.length,
                      ));
                },
              ),
            )
          ],
        ));
  }
}



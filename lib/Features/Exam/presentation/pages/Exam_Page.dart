import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:online_exam/Core/DI/DI.dart';
import 'package:online_exam/Core/Resources/ColorsManager.dart';
import 'package:online_exam/Features/Exam/presentation/Manager/exam_cubit.dart';
import 'package:online_exam/Features/Exam/presentation/widgets/QuestionWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExamPage extends StatefulWidget {

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
   int timeleft=30; // Set the initial time left in seconds
  void startcountdown(){
    Timer.periodic(Duration(seconds: 1),(timer){
      setState(() {
      timeleft= timeleft-1;

      });
      if(timeleft<0){
        timeleft=0;
      }
    });
  }
  PageController pageController = PageController(initialPage: 0);

  int activeIndex = 0;
  

  @override
  void initState() {
    startcountdown();
    super.initState();
  }
  void dispose() {
    pageController.dispose(); // Dispose of the PageController
    super.dispose(); // Call the superclass dispose method
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.alarm),
            onPressed: () {
              // Handle settings action
            },
          ),
         TimerCountdown(
         format: CountDownTimerFormat.minutesSeconds,
         endTime: DateTime.now().add(Duration(seconds: timeleft)),
         onEnd: (){
           showDialog(
               context: context,
               builder: (context) => AlertDialog(
                 content: Center(
                   child: Column(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Text("Time is up!",
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                           color: Colors.red,
                         ),
                       ),
                     ],
                   ),
                 ),
               ));
         },
         /* Text("${timeleft.toString()}:00",
            style: TextStyle(
              fontSize:20,
              color: Colors.green,
              fontWeight: FontWeight.w400,
            ),
          ),*/
         )],
      ),
      body: BlocProvider(
  create: (context) =>getIt<ExamCubit>()..GetAllQuestions(),
  child: BlocBuilder<ExamCubit,ExamState>(
    buildWhen: (previous,current){
      if(current is ExamSuccesState||
      current is ExamErrorState||
      current is ExamLoadingState){
        return true;
      }
      return false;
    },
  builder: (context, state) {
      if(state is ExamSuccesState){
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: state.question.length,
                  onPageChanged: (value) {
                    setState(() {
                      activeIndex = value;
                    });

                    // Update the state to reflect the current page index
                  },
                  itemBuilder: (context,index)=>Column(
                    children: [
                      Center(
                        child: Row(
                          children: [
                            Center(
                              child: Text('Question $index of ${state.question.length}'),

                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      AnimatedSmoothIndicator(activeIndex: activeIndex, count:state.question.length,
                        effect: ExpandingDotsEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          activeDotColor: ColorsManager.secondaryColor,
                          dotColor: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20),


                      Text(state.question[index]?.question??" ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),),
                      SizedBox(height:5,),
                      Expanded(
                        flex: 2,
                        child: ListView.separated(itemBuilder:(context,index)=>  QuesstionWidget(title:state.question[index]?.answers?[index]),
                          separatorBuilder: (context,index)=>SizedBox(height:5),
                          itemCount: 4,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (activeIndex > 0) {
                                    pageController.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Text('Previous',
                                  style: TextStyle(
                                    color: ColorsManager.secondaryColor,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:Colors.white
                                ),
                              ),
                            ),
                            SizedBox(width: 30),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (activeIndex < state.question.length - 1) {
                                    pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                  else{
                                   // Navigator.pushReplacementNamed(, routeName)
                                  }
                                },
                                child: Text(activeIndex < state.question.length ? 'Next' : 'Submit'
                                  ,style: TextStyle(
                                    color: Colors.white,
                                  ),),


                                style: ElevatedButton.styleFrom(
                                    backgroundColor:ColorsManager.secondaryColor
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),



                    ],

                  ),
                ),
              ),
            ],
          ),
        );
      }
      if(state is ExamErrorState ){
        return Center(child: Text(state.error));
      }
      return Center(child: CircularProgressIndicator());

  },
),
)
    );
  }
}
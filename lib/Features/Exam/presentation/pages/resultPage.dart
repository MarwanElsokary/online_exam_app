import 'package:flutter/material.dart';
import 'package:online_exam/Core/Resources/ColorsManager.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exam Score"),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Your Score",
            style: TextStyle(
              fontSize:18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircularPercentIndicator(radius:60.0,
                lineWidth: 4,
                percent: 0.8,
                  center: Text(
                    "${(0.8 * 100).toInt()}%",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                progressColor: ColorsManager.secondaryColor,

                animation: true,
                animationDuration: 1200,
                backgroundColor: Colors.red,),
                SizedBox(width: 50),

                // Correct & Incorrect
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Correct", style: TextStyle(color: ColorsManager.secondaryColor)),
                        SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: ColorsManager.secondaryColor, width: 2),
                          ),
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.white,
                            child: Text(
                              "9",
                              style: TextStyle(color: ColorsManager.secondaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text("Incorrect", style: TextStyle(color: Colors.red)),
                        SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.red, width: 2),
                          ),
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.white,
                            child: Text(
                              "7",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),

              ],
            )
                    ],
                  ),
          ),
          SizedBox(height: 90,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {}
                    ,
                    child: Text('Start again',
                      style: TextStyle(
                        color: ColorsManager.secondaryColor,fontSize: 16
                          ,fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.white,
                            side: BorderSide(
                              color: ColorsManager.secondaryColor,
                              width: 2.0,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {}
                    ,
                    child: Text('Show Result',
                      style: TextStyle(
                        color: Colors.white,fontSize: 16
                        ,fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:ColorsManager.secondaryColor,
                      side: BorderSide(
                        color: ColorsManager.secondaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


    ]
      )    );
  }
}
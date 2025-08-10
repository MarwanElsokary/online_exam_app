import 'package:flutter/material.dart';
import 'package:online_exam/Core/Resources/ColorsManager.dart';
import 'package:online_exam/Core/RoutesManager/routes.dart';

class SubSubjectWidget extends StatelessWidget{
  String? subSubjectName;
  String? subSubjectDescription;
  int ?questionCount;
  int ?timer;
  SubSubjectWidget({
    super.key,
    required this.subSubjectName,
    required this.subSubjectDescription,
    required this.questionCount,
    required this.timer,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the exam details page or perform any action
        Navigator.pushNamed(context,Routes.examdetailsRoute



        );
        //arguments: subSubjectName
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(Icons.book, size: 30, color: ColorsManager.secondaryColor),
                const SizedBox(width: 10,),
               Expanded(
                 child: Column(
                   children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                             subSubjectName?? " ",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color:ColorsManager.tretaryColor
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              questionCount.toString(),
                              style: const TextStyle(
                                fontSize: 13,
                                color: ColorsManager.tretaryColor,
                              ),
                            ),
                          ],
                        ),
                       Spacer(flex: 2,),
                        Text(timer.toString()??" ",style: TextStyle(fontSize: 13,
                        fontWeight: FontWeight.w400,
                          color: ColorsManager.secondaryColor
                        ),)
                      ],
                    ),

                     const SizedBox(height: 10,),
                    Text(
                      subSubjectDescription??" ",
                      style: const TextStyle(
                        fontSize: 13,
                        color: ColorsManager.tretaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                   ],
                 ),
               ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:online_exam/Core/RoutesManager/routes.dart';

class Subjectwidget extends StatelessWidget{
  Icon icon;
  String subjectname;
  Subjectwidget({super.key, required this.icon, required this.subjectname});
  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: InkWell(
       onTap: (){
          // Navigate to the sub-subjects page or perform any action
          Navigator.pushReplacementNamed(context,Routes.SubSubjectsRoute);
          //arguments: subjectname
       },
       child: Container(
         decoration: BoxDecoration(
           color: Colors.transparent,
           borderRadius: BorderRadius.circular(10),
           border: Border.all(
             color: Colors.grey.withOpacity(0.2),
             width: 2,
           ),
           /*boxShadow: [
             BoxShadow(
               color: Colors.grey.withOpacity(0.2),
               spreadRadius: 1,
               blurRadius: 5,
               offset: const Offset(0, 3), // changes position of shadow
             ),
           ],*/
         ),
         child: Padding(
           padding: const EdgeInsets.all(20.0),
           child: Row(
             children: [
               icon,
               const SizedBox(width: 10,),
               Text(
                 subjectname,
                 style: const TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.w500,
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
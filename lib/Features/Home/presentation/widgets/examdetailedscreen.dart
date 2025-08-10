import 'package:flutter/material.dart';
import 'package:online_exam/Core/Resources/ColorsManager.dart';
import 'package:online_exam/Core/Resources/stringsManager.dart';

class examdetailedscreen extends StatelessWidget{
  const examdetailedscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.book, size: 30, color: ColorsManager.secondaryColor),
                            const SizedBox(width: 10,),
                            Text(StringsManager.exam, style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: ColorsManager.tretaryColor
                            )),
                          Spacer(flex: 2,),
                          Text(StringsManager.timer, style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: ColorsManager.secondaryColor
                          )),],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(StringsManager.Highlevel, style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorsManager.tretaryColor
                            )),
                            const SizedBox(width: 10,),
                            Text(StringsManager.numques, style: const TextStyle(
                                fontSize: 13,
                                color: ColorsManager.tretaryColor
                            )),
                          ],
                        ),
                        SizedBox(height: 15),
                        Divider(
                          color: Colors.grey.withOpacity(0.2),
                          thickness: 1,
                        ),
                        SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(StringsManager.Instructions, style: const TextStyle(
                                fontSize: 18,
                                color: ColorsManager.tretaryColor
                            )),
                            SizedBox(height: 10),
                            Text(StringsManager.instruction1, style: const TextStyle(
                                fontSize: 14,
                                color: ColorsManager.tretaryColor
                              )),
                            SizedBox(height: 5),
                            Text(StringsManager.instruction1, style: const TextStyle(
                                fontSize: 14,
                                color: ColorsManager.tretaryColor
                            )),SizedBox(height: 5),
                            Text(StringsManager.instruction1, style: const TextStyle(
                                fontSize: 14,
                                color: ColorsManager.tretaryColor
                            )),SizedBox(height: 5),
                            Text(StringsManager.instruction1, style: const TextStyle(
                                fontSize: 14,
                                color: ColorsManager.tretaryColor
                            )),
                            SizedBox(height: 20),


      ElevatedButton(
        onPressed:(){},
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.secondaryColor,
          textStyle: TextStyle(color: Colors.white),
          padding: EdgeInsets.all(20.0),
          fixedSize: Size(300, 60),
        ),

        child: Text(StringsManager.Start, style: TextStyle(color: Colors.white)),
      )
                          ],
                        ),




                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
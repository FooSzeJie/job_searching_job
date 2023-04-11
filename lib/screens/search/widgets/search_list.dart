import 'package:flutter/material.dart';
import 'package:job_searching_app/models/job.dart';
import 'package:job_searching_app/screens/home/widgets/job_item.dart';

class SearchList extends StatelessWidget {
  final jobList = Job.generateJobs();

  SearchList({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Container(
       height: 500,
       margin: EdgeInsets.only(
         top: 25,
       ),
       child: ListView.separated(
         // scrollDirection: Axis.vertical,
         // shrinkWrap: true,
         padding: EdgeInsets.only(
           top: 12.5,
           left: 25.0,
           right: 25.0,
           bottom: 12.5,
         ),
         itemBuilder: (context, index) => JobItem(
           jobList[index],
           showTime: true,
         ),
         separatorBuilder: (_, index) => SizedBox(height: 20.0,),
         itemCount: jobList.length
       ),
     );
   }
 }
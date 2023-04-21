import 'package:flutter/material.dart';
import 'package:job_searching_app/models/job.dart';
import 'package:job_searching_app/screens/home/widgets/job_item.dart';
import 'package:job_searching_app/screens/search/widgets/search_job_detail.dart';

class SearchList extends StatelessWidget {
  List <Job> jobs = allJobs;

  SearchList({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Expanded(
       child: ListView.builder(
         itemCount: jobs.length,
         itemBuilder: (context, index) {
           final job = jobs[index];

           // return ListTile(
           //   leading: Image.asset(job.logoUrl,
           //   fit: BoxFit.cover,
           //     width: 50,
           //     height: 50,
           //   ),
           //   title: Text(job.company),
           //   // onTap: () => Navigator.push(
           //   //   context, MaterialPageRoute(builder: (context) => SearchJobDetail(job : job));
           //   // ),
           // );
           return Container();
         }
       )
     );
   }
 }
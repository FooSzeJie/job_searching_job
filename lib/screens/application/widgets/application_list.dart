 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_searching_app/database/job_database.dart';
import 'package:job_searching_app/screens/application/widgets/application_detail.dart';

class ApplicationList extends StatelessWidget {
   const ApplicationList({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     // Display the data from the firebase database
     return Padding(
       padding: const EdgeInsets.only(bottom: 20.0),
       child: StreamBuilder<QuerySnapshot>(
         // Use read function from the JobDatabase
         stream: JobDatabase.readItems(),
         builder: (context, snapshot) {
           if(snapshot.hasError) {
             // When occur error will display this word
             return const Text('Something went wrong');
           }
           // If having data will display like list
           else if(snapshot.hasData || snapshot.data != null) {
             return ListView.separated(
               scrollDirection: Axis.vertical,
               shrinkWrap: true,
               itemBuilder: (context, index) {
                 var jobInfo = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                 String jobID = snapshot.data!.docs[index].id;

                   // Firebase Data
                   int jobId = jobInfo['jobId'];
                   String company = jobInfo['company'];
                   String logoUrl = jobInfo['logoUrl'];
                   String title = jobInfo['title'];
                   String location = jobInfo['location'];
                   String time = jobInfo['time'];
                   List <String> req = jobInfo['req'].cast<String>();

                   // The Job Items
                   return Container(
                     margin: const EdgeInsets.symmetric(horizontal: 10.0),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       border: Border.all(
                         color: Colors.grey,
                       ),
                       borderRadius: BorderRadius.circular(8.0),
                     ),
                     child: ListTile(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(8.0),
                       ),
                       onTap: () {
                         // Show a Modal
                         showModalBottomSheet(
                           backgroundColor: Colors.white,
                           isScrollControlled: true,
                           context: context,
                           // Pop up ApplicationDetail after on-tap
                           builder: (context) => ApplicationDetail(jobId, company, logoUrl, title, location, time, req, jobID),
                         );
                       },
                       title: Text(
                         company,
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                       ),
                       subtitle: Text(
                         time,
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                       ),
                     ),
                   );
                 },
                 separatorBuilder: (context, index) => const SizedBox(height: 16.0,),
                 itemCount: snapshot.data!.docs.length,
               );
             }
             return const Center(
               child: CircularProgressIndicator(
                 valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
               ),
             );
           },
         ),
     );
   }
 }

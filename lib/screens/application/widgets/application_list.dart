 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_searching_app/database/job_database.dart';

class ApplicationList extends StatelessWidget {
   const ApplicationList({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return StreamBuilder<QuerySnapshot>(
       stream: JobDatabase.readItems(),
       builder: (context, snapshot) {
         if(snapshot.hasError) {
           return Text('Something went wrong');
         }
         else if(snapshot.hasData || snapshot.data != null) {
           return ListView.separated(
             scrollDirection: Axis.vertical,
             shrinkWrap: true,
             itemBuilder: (context, index) => SizedBox(height: 16.0,),
             separatorBuilder: (context, index) {
               var jobInfo = snapshot.data!.docs[index].data() as Map<String, dynamic>;
               String jobID = snapshot.data!.docs[index].id;

               // Firebase Data
               int jobId = jobInfo['jobId'];
               String company = jobInfo['company'];
               String logoUrl = jobInfo['logoUrl'];
               bool isMark = jobInfo['isMark'];
               String title = jobInfo['title'];
               String location = jobInfo['location'];
               String time = jobInfo['time'];
               List <String> req = jobInfo['req'].cast<String>();

               return Ink(
                 decoration: BoxDecoration(
                   color: Colors.blueGrey,
                   borderRadius: BorderRadius.circular(8.0),
                 ),
                 child: ListTile(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(8.0),
                   ),
                   onTap: () {},
                   title: Text(
                     company,
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
               );
             },
             itemCount: snapshot.data!.docs.length,
           );
         }
         return Center(
           child: CircularProgressIndicator(
             valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
           ),
         );
       },
     );
   }
 }

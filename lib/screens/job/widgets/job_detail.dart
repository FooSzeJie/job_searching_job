import 'package:flutter/material.dart';
import 'package:job_searching_app/models/job.dart';
import 'package:job_searching_app/widgets/icon_text.dart';
import 'package:job_searching_app/database/job_database.dart';

// Job Detail
class JobDetail extends StatelessWidget {
  final Job job;

  const JobDetail(this.job, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: 550,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 5.0,
              width: 60.0,
              color: Colors.grey.withOpacity(0.3),
            ),

            const SizedBox(height: 30.0,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: Image.asset(job.logoUrl),
                        ),

                        const SizedBox(width: 30.0,),

                        Text(
                          job.company,
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20.0,),

            Text(
              job.title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconText(Icons.location_on_outlined, job.location),
                IconText(Icons.access_time_outlined, job.time),
              ],
            ),

            const SizedBox(height: 30.0,),

            const Text(
              'Requirement',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10.0),

            ...job.req.map((e) => Container(
              margin: const EdgeInsets.symmetric(vertical: 5 ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(width: 10,),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Text(
                      e,
                      style: const TextStyle(
                        wordSpacing: 2.5,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            )).toList(),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 25.0),
              height: 45.0,
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )
                ),
                onPressed: () async {

                  // Add data to the firebase database through JobDatabase.addItem()
                  await JobDatabase.addItem(
                    jobId: job.jobId,
                    company: job.company,
                    logoUrl: job.logoUrl,
                    title: job.title,
                    location: job.location,
                    time: job.time,
                    req: job.req
                  );

                  Navigator.of(context).pop();
                },
                child: const Text('Apply Now'),
              ),
            ),
          ],
        ),
      ),
    );


  }
}



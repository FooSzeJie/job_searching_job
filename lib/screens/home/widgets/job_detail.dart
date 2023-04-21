import 'package:flutter/material.dart';
import 'package:job_searching_app/models/job.dart';
import 'package:job_searching_app/widgets/icon_text.dart';

class JobDetail extends StatelessWidget {
  final Job job;

  JobDetail(this.job);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
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

            SizedBox(height: 30.0,),

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
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: Image.asset(job.logoUrl),
                        ),

                        SizedBox(width: 30.0,),

                        Text(
                          job.company,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // job.changeBookMark();
                            print(job.isMark);
                          },
                          child: Icon(
                            job.isMark ? Icons.bookmark : Icons.bookmark_outline_rounded,
                            color: job.isMark ? Theme.of(context).primaryColor : Colors.black,
                          ),
                        ),
                        Icon(Icons.more_horiz_outlined),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20.0,),

            Text(
              job.title,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconText(Icons.location_on_outlined, job.location),
                IconText(Icons.access_time_outlined, job.time),
              ],
            ),

            SizedBox(height: 30.0,),

            Text(
              'Requirement',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10.0),

            ...job.req.map((e) => Container(
              margin: EdgeInsets.symmetric(vertical: 5 ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(width: 10,),

                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: Text(
                      e,
                      style: TextStyle(
                        wordSpacing: 2.5,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            )).toList(),

            Container(
              margin: EdgeInsets.symmetric(vertical: 25.0),
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
                onPressed: () {},
                child: Text('Apply Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:job_searching_app/models/job.dart';
import 'package:job_searching_app/screens/job/widgets/job_detail.dart';
import 'package:job_searching_app/screens/job/widgets/job_item.dart';

class JobList extends StatelessWidget {
  // final jobList = Job.generateJobs();
  final jobs = allJobs;

  JobList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 600,
          margin: EdgeInsets.only(
            top: 25,
          ),
          child: ListView.separated(
              padding: EdgeInsets.only(
                top: 12.5,
                left: 25.0,
                right: 25.0,
                bottom: 12.5,
              ),
              itemBuilder: (context, index) => GestureDetector(

                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => JobDetail(jobs[index]),
                  );
                },
                child: JobItem(jobs[index]),
              ),
              separatorBuilder: (_, index) => SizedBox(height: 20.0,),
              itemCount: allJobs.length
          ),
      ),
    );
  }
}
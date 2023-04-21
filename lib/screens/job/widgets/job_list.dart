import 'package:flutter/material.dart';
import 'package:job_searching_app/models/job.dart';
import 'package:job_searching_app/screens/job/widgets/job_detail.dart';
import 'package:job_searching_app/screens/job/widgets/job_item.dart';

class JobList extends StatelessWidget {

  // Job List Data in Job Model
  final jobs = allJobs;

  JobList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 600,
          margin: const EdgeInsets.only(
            top: 25,
          ),
          child: ListView.separated(
              padding: const EdgeInsets.only(
                top: 12.5,
                left: 25.0,
                right: 25.0,
                bottom: 12.5,
              ),
              itemBuilder: (context, index) => GestureDetector(

                onTap: () {
                  // Pop up the Modal after onClick
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => JobDetail(jobs[index]),
                  );
                },
                child: JobItem(jobs[index]),
              ),
              separatorBuilder: (_, index) => const SizedBox(height: 20.0,),
              itemCount: allJobs.length
          ),
      ),
    );
  }
}
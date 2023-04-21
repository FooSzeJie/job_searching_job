import 'package:flutter/material.dart';
import 'package:job_searching_app/models/job.dart';
import 'package:job_searching_app/screens/home/widgets/job_detail.dart';
import 'package:job_searching_app/screens/home/widgets/job_item.dart';

class JobList extends StatelessWidget {

  // Get the Job list from the Job Modal
  final jobList = allJobs;

  JobList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25.0),
      height: 160.0,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              // Pop up Modal when onclick the item
              showModalBottomSheet(
                backgroundColor: Colors.white,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => JobDetail(jobList[index]),
              );
            },
            child: JobItem(jobList[index]),
          ),
          separatorBuilder: (_, index) => const SizedBox(
            width: 15.0,
          ),
          itemCount: jobList.length),
    );
  }
}

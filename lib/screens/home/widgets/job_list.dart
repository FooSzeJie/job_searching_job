import 'package:flutter/material.dart';
import 'package:job_searching_app/screens/home/widgets/job_detail.dart';
import 'package:job_searching_app/screens/home/widgets/job_item.dart';

import '../../../models/job.dart';

class JobList extends StatelessWidget {

  final jobList = Job.generateJobs();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.0),
      height: 160.0,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => JobDetail(jobList[index]),
              );
            },
            child: JobItem(jobList[index]),
          ),
          separatorBuilder: (_, index) => SizedBox(
            width: 15.0,
          ),
          itemCount: jobList.length),
    );
  }
}

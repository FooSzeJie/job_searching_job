import 'package:flutter/material.dart';
import 'package:job_searching_app/models/job.dart';
import 'package:job_searching_app/screens/job/widgets/Job_app_bar.dart';
import 'package:job_searching_app/screens/job/widgets/job_list.dart';

class JobPage extends StatefulWidget {
  const JobPage({Key? key}) : super(key: key);

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {

  // Job data from the Job Models
  List<Job> jobs = allJobs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),

              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Widgets in the job Page
              const JobAppBar(),
              JobList(),
            ],
          ),
        ],
      ),
    );
  }
}

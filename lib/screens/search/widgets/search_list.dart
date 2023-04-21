import 'package:flutter/material.dart';
import 'package:job_searching_app/models/job.dart';
import 'package:job_searching_app/screens/search/widgets/search_job_detail.dart';
import 'package:job_searching_app/widgets/icon_text.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    super.key,
    required this.jobs,
  });

  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            final job = jobs[index];

            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => SearchJobDetail(jobs[index]),
                );
              },
              child: Container(
                width: 270,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Column(
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

                            const SizedBox(width: 10.0,),

                            Text(job.company,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 15.0,),

                    Text(job.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconText(Icons.location_on_outlined, job.location),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
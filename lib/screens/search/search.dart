import 'package:flutter/material.dart';
import 'package:job_searching_app/models/job.dart';
import 'package:job_searching_app/screens/home/widgets/job_detail.dart';
import 'package:job_searching_app/screens/home/widgets/job_item.dart';
import 'package:job_searching_app/screens/search/widgets/search_app_bar.dart';
import 'package:job_searching_app/screens/search/widgets/search_job_detail.dart';
import 'package:job_searching_app/screens/search/widgets/search_list.dart';
import 'package:job_searching_app/screens/search/widgets/search_option.dart';
import 'package:job_searching_app/widgets/icon_text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Job> jobs = allJobs;

  void searchBook(String query) {
    final suggestion = allJobs.where((job) {
      final jobCompany = job.company.toLowerCase();
      final input = query.toLowerCase();

      return jobCompany.contains(input);
    }).toList();

    setState(() {
      jobs = suggestion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
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
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  left: 25,
                  right: 25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                            contentPadding: EdgeInsets.zero,
                            prefixIcon: Container(
                              padding: EdgeInsets.all(15),
                              child: Image.asset(
                                'assets/icons/search.png',
                                width: 20,
                              ),
                            )),
                        onChanged: searchBook,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Image.asset('assets/icons/filter.png'),
                    ),
                  ],
                ),
              ),

              SearchOption(),

              Expanded(
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
                            builder: (context) => JobDetail(jobs[index]),
                          );
                        },
                        child: Container(
                          width: 270,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.symmetric(vertical: 10.0),
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
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey.withOpacity(0.1),
                                        ),
                                        child: Image.asset(job.logoUrl),
                                      ),

                                      SizedBox(width: 10.0,),

                                      Text(job.company,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Icon(job.isMark ? Icons.bookmark : Icons.bookmark_outline_outlined,
                                    color: job.isMark ? Theme.of(context).primaryColor: Colors.white,
                                  ),
                                ],
                              ),

                              SizedBox(height: 15.0,),

                              Text(job.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 15.0,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconText(Icons.location_on_outlined, job.location),
                                  if(job.isMark) IconText(Icons.access_time_outlined, job.time),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

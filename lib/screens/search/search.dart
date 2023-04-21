import 'package:flutter/material.dart';
import 'package:job_searching_app/models/job.dart';
import 'package:job_searching_app/screens/search/widgets/search_list.dart';
import 'package:job_searching_app/screens/search/widgets/search_option.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  // Get the data from the Job Model
  List<Job> jobs = allJobs;

  // Search function
  void searchJob(String query) {
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

              // Component of the head of the Search Page
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
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
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
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                            contentPadding: EdgeInsets.zero,
                            prefixIcon: Container(
                              padding: const EdgeInsets.all(15),
                              child: Image.asset(
                                'assets/icons/search.png',
                                width: 20,
                              ),
                            )),
                        onChanged: searchJob,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Image.asset('assets/icons/filter.png'),
                    ),
                  ],
                ),
              ),

              // Component of the option of the search Pge
              const SearchOption(),

              // Search Result
              SearchList(jobs: jobs),
            ],
          ),
        ],
      ),
    );
  }
}

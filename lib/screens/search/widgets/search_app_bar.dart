import 'package:flutter/material.dart';
import 'package:job_searching_app/models/job.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {

  List <Job> jobs = allJobs;

  @override
  Widget build(BuildContext context) {
    return Container(
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

          SizedBox(width: 20,),

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
                  )
              ),
              onChanged: searchBook,
            ),
          ),

          SizedBox(width: 10.0,),

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
    );
  }

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
}




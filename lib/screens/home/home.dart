import 'package:flutter/material.dart';
import 'package:job_searching_app/screens/home/widgets/home_app_bar.dart';
import 'package:job_searching_app/screens/home/widgets/job_list.dart';
import 'package:job_searching_app/screens/home/widgets/search_card.dart';
import 'package:job_searching_app/screens/home/widgets/tag_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                        color: Colors.grey.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),

                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeAppBar(),
                      SearchCard(),
                      TagList(),
                      JobList(),
                    ],
                  ),
                ),
              ],
            ),


      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).accentColor,
      //   onPressed: () {},
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
      // bottomNavigationBar: Theme(
      //   data: ThemeData(
      //     splashColor: Colors.transparent,
      //     highlightColor: Colors.transparent,
      //   ),
      // ),
    );

  }
}

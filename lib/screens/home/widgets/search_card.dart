import 'package:flutter/material.dart';
import 'package:job_searching_app/screens/search/search.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 40.0,
      ),
      height: 300,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        image: DecorationImage(
          image: AssetImage('assets/images/search_bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Fast Search",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
            ),
          ),

          SizedBox(height: 19,),

          Text('You can search quickly for\n the job you want',
            style: TextStyle(
              height: 1.8,
              color: Colors.white,
              fontWeight: FontWeight.w400,
          ),
          ),

          SizedBox(height: 30.0,),

          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SearchPage())
              );
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Image.asset('assets/icons/search.png',
                  width: 20,
                  ),

                  SizedBox(width: 10,),

                  Text('Search',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

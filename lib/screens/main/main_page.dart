import 'package:flutter/material.dart';
import 'package:job_searching_app/screens/application/app_page.dart';
import 'package:job_searching_app/screens/bookmark/bookmark_page.dart';
import 'package:job_searching_app/screens/home/home.dart';
import 'package:job_searching_app/database//auth.dart';
import 'package:job_searching_app/screens/job/job_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List pages = [
    HomePage(),
    JobPage(),
    BookmarkPage(),
    ApplicationPage(),
  ];

  int currentIndex = 0;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;

      if(currentIndex == 4) {
        signOut();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        // onTap: onTap,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        // selectedItemColor: Theme.of(context).primaryColor,
        // type: BottomNavigationBarType.fixed,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home,
              size: 20.0,
            ),
          ),

          BottomNavigationBarItem(
            label: 'Case',
            icon: Icon(Icons.cases_outlined,
              size: 20.0,
            ),
          ),

          BottomNavigationBarItem(
            label: 'BookMark',
            icon: Icon(Icons.bookmark,
              size: 20.0,
            ),
          ),

          BottomNavigationBarItem(
            label: 'Chat',
            icon: Icon(Icons.chat_outlined,
              size: 20.0,
            ),
          ),

          BottomNavigationBarItem(
            label: 'LogOut',
            icon: Icon(Icons.logout,
              size: 20.0,
            ),
          ),

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:job_searching_app/screens/application/app_page.dart';
import 'package:job_searching_app/screens/home/home.dart';
import 'package:job_searching_app/database//auth.dart';
import 'package:job_searching_app/screens/job/job_page.dart';
import 'package:job_searching_app/screens/main/logoutFunction.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  // All the Mainpage in App
  List pages = [
    const HomePage(),
    const JobPage(),
    const ApplicationPage(),
    const Logout()
  ];

  // page now
  int currentIndex = 0;

  // Sign out function
  Future<void> signOut() async {
    await Auth().signOut();
  }

  // change the currentIndex number after On-tap for going to the other pages
  void onTap(int index) async{
    currentIndex;

    setState(() {
      currentIndex = index;
    });

    if(currentIndex == 3) {
      await signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],

      // Bottom Navigator Bar
      bottomNavigationBar: BottomNavigationBar(
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
        items: const [
          // Each Bottom Button
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

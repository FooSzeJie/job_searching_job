import 'package:flutter/material.dart';
import 'package:job_searching_app/screens/login/login_page.dart';
import 'package:job_searching_app/database/auth.dart';
import 'package:job_searching_app/screens/main/main_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MainPage();
        }
        else {
          return const LoginPage();
        }
      }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:job_searching_app/screens/application/widgets/application_app_bar.dart';
import 'package:job_searching_app/screens/application/widgets/application_list.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background Color
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

          // The ApplicationPage Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ApplicationAppBar(),
                ApplicationList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

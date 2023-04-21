import 'package:flutter/material.dart';

class JobAppBar extends StatelessWidget {
  const JobAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The head of Job List page
    return Container(
      alignment: const Alignment(0, 0),
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: const Text(
        'Jobs List',
        style: TextStyle(
          color: Colors.black38,
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
        ),
      )
    );
  }
}

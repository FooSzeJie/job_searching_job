import 'package:flutter/material.dart';

class ApplicationAppBar extends StatelessWidget {
  const ApplicationAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The title in the Application Page
    return Container(
        alignment: const Alignment(0, 0),
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: const Text(
          'Application List',
          style: TextStyle(
            color: Colors.black38,
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
          ),
        )
    );;
  }
}

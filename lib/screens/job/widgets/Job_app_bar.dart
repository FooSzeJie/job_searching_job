import 'package:flutter/material.dart';

class JobAppBar extends StatelessWidget {
  const JobAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0),
      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Text(
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

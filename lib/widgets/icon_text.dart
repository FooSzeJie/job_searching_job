import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  IconText(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.yellow,
          ),

          SizedBox(width: 18,),

          Text(
              text,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
          ),
        ],
      ),
    );
  }
}

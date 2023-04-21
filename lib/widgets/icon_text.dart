import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  // Constructor
  const IconText(this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.yellow,
          ),

          const SizedBox(width: 18,),

          Text(
              text,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
          ),
        ],
      ),
    );
  }
}

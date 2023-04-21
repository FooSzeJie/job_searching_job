import 'package:flutter/material.dart';

class TagList extends StatefulWidget {
  const TagList({Key? key}) : super(key: key);

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {

  // Show the tags
  final tagsList = <String> ['All', '⚡  Popular', '✨  Featured'];
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState( () {
              selected = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            decoration: BoxDecoration(
              color: selected == index ? Theme.of(context).primaryColor.withOpacity(0.2) : Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: selected == index ? Theme.of(context).primaryColor.withOpacity(0.2) : Colors.white,
              )
            ),
            child: Text(tagsList[index]),
          ),
        ),
        separatorBuilder: (_, index) => const SizedBox(
          width: 15.0,
        ),
        itemCount: tagsList.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextBlock extends StatelessWidget {
  final String title;
  final String subtitle;

  TextBlock({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 22),
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 12,
                fontWeight: FontWeight.w700,
                height: 1.3333333333,
                color: Color(0xff383838),
              ),
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.3333333333,
              color: Color(0xff707070),
            ),
          ),
        ],
      ),
    );
  }
}

//use in figma
// TextBlock(
// title: 'Tina has submitted her homework',
// subtitle: 'Homework | Science | Digestive systems',
// )

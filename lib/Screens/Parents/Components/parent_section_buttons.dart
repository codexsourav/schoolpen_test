import 'package:flutter/material.dart';

class SectionButtonComponent extends StatelessWidget {
  final String label;
  final String iconImagePath;
  final Color backgroundColor;

  SectionButtonComponent({
    required this.label,
    required this.iconImagePath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
      width: 135.99,
      height: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0 ,0,8,0),
              width: 30 ,
              height: 30 ,
              child: Image.asset(
                iconImagePath,
                width: 22,
                height: 20 ,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0,1,0,0),
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: Color(0xff707070),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

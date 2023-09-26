import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String teacherName;
  final String imageAsset;
  final String iconAsset;

  LessonCard({
    required this.title,
    required this.subtitle,
    required this.teacherName,
    required this.imageAsset,
    required this.iconAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: 328,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
              width: double.infinity,
              height: 187,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 11,
                    child: Container(
                      width: 328,
                      height: 186,
                      decoration: BoxDecoration(
                        color: Color(0xff1acf82),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 328,
                          height: 176,
                          child: Image.asset(
                            imageAsset,
                            width: 328,
                            height: 176,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 27,
                    child: Align(
                      child: SizedBox(
                        width: 45,
                        height: 12,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400,
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 139,
                    child: Align(
                      child: SizedBox(
                        width: 177,
                        height: 12,
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            decoration: TextDecoration.none,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 159,
                    child: Align(
                      child: SizedBox(
                        width: 86,
                        height: 12,
                        child: Text(
                          'View Lesson',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            height: 1,
                            color: Colors.white,
                            decorationColor: Color(0xff383838),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 65,
                    top: 93,
                    child: Align(
                      child: SizedBox(
                        width: 100,
                        height: 12,
                        child: Text(
                          teacherName,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400,
                            height: 0.75,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 49,
                    child: Align(
                      child: SizedBox(
                        width: 100,
                        height: 24,
                        child: Text(
                          'Science',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 24,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w700,
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 83,
                    child: Align(
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: Image.asset(
                          iconAsset,
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 247,
                    top: 0,
                    child: Align(
                      child: SizedBox(
                        width: 56,
                        height: 77,
                        child: Image.asset(
                          'assets/images/taxi-407-1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

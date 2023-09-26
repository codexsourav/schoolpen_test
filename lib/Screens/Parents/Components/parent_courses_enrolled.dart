import 'package:flutter/material.dart';

class TwoColumnCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String schoolName;
  final String progress;

  const TwoColumnCard({
    required this.imagePath,
    required this.title,
    required this.schoolName,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
          16, 0, 0, 40), // Replace with specific values
      // width: double.infinity,
      height: 220, // Replace with a specific value
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildColumn(imagePath, title, schoolName, progress),
          //  _buildColumn(imagePath, title, schoolName, progress),
        ],
      ),
    );
  }

  Widget _buildColumn(
    String imagePath,
    String title,
    String schoolName,
    String progress,
  ) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 16, 0), // Replace with specific values
      width: 288, // Replace with a specific value
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0x1956e484),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(
                0, 0, 0, 16), // Replace with specific values
            width: 288, // Replace with a specific value
            height: 104, // Replace with a specific value
            child: Image.asset(
              imagePath,
              width: 288,
              height: 104,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                24, 0, 0, 0), // Replace with specific values
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.2,
                color: Color(0xff383838),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
                24, 7, 24, 16), // Replace with specific values
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0, 0, 66, 24), // Replace with specific values
                  width: double.infinity,
                  height: 16, // Replace with a specific value
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0, 0, 4, 0), // Replace with specific values
                        padding:
                            EdgeInsets.all(0.1), // Replace with specific values
                        height: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/mask-group-2.png'),
                          ),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 15.8,
                            height: 15.8,
                            child: Image.asset(
                              'assets/images/ellipse-2-7EH.png',
                              width: 15.8,
                              height: 15.8,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        schoolName,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          color: Color(0xff707070),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0, 0, 0, 5), // Replace with specific values
                  child: Text(
                    'Overall Progress $progress',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      height: 1,
                      color: Color(0xff383838),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 178,
                      height: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xff56e484),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

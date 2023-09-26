import 'package:flutter/material.dart';

class TeacherInfoCard extends StatelessWidget {
  final String teacherName;
  final String subject;
  final String imageUrl;

  TeacherInfoCard({
    required this.teacherName,
    required this.subject,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 54,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Color(0xFF83D39D)),
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      child: Row(
        children: [
          // Image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 30,
            ),
          ),
          // Text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    teacherName,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Text color
                    ),
                  ),
                  Text(
                    subject,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black, // Text color
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Phone Icon
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.phone,
              color: Color(0xff56E484), // Icon color
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.message,
              color: Color(0xff56E484), // Icon color
            ),
          ),
        ],
      ),
    );
  }
}

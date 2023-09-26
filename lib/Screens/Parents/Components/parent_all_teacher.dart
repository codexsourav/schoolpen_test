import 'package:flutter/material.dart';

class AllTeacherCard extends StatelessWidget {
  final String teacherName;
  final String subject;
  final String imageUrl;

  AllTeacherCard({
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
        color: Color(0xff56E484), // Fill color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 30,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
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
        ],
      ),
    );
  }
}

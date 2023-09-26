import 'package:flutter/material.dart';

class StudentDrawerScreen extends StatefulWidget {
  const StudentDrawerScreen(
      {super.key,
      required this.schoolName,
      required this.location,
      required this.profileImg});
  final String schoolName;
  final String location;
  final String profileImg;
  @override
  State<StudentDrawerScreen> createState() => _StudentDrawerScreenState();
}

class _StudentDrawerScreenState extends State<StudentDrawerScreen> {
  bool academicSubIcon = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(children: [
      Container(
        height: h * 0.1,
        margin: const EdgeInsets.only(top: 50, left: 20),
        child: Row(
          children: [
            Container(
              width: w * 0.2,
              height: h * 0.2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage(widget.profileImg), fit: BoxFit.fill),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.schoolName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.05,
                    ),
                  ),
                  Text(
                    widget.location,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: w * 0.04,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.person_rounded),
              title: const Text("Teacher"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.people_alt),
              title: const Text("Classmates"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.library_books),
              title: const Text("Syllabus"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.edit_calendar_sharp),
              title: const Text("Attendance"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.calendar_month),
              title: const Text("Calender"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.push_pin),
              // trailing: ,
              title: const Text("School Board"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.currency_rupee),
              title: const Text("Fee Portal"),
            ),
            SizedBox(height: h * 0.12),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.logout),
              title: const Text("Exit"),
            ),
          ],
        ),
      ),
    ]);
  }
}

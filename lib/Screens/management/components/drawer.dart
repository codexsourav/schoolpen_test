import 'package:flutter/material.dart';

import '../constant/paths.dart';
import '../constant/strings.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen(
      {super.key,
      required this.schoolName,
      required this.location,
      required this.profileImg});
  final String schoolName;
  final String location;
  final String profileImg;
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool academicSubIcon = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(children: [
      Container(
        height: h * 0.1,
        margin: const EdgeInsets.only(top: 50),
        child: Row(
          children: [
            Container(
              width: w * 0.2,
              height: h * 0.2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(widget.profileImg),
                ),
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
                  SizedBox(
                    width: 250,
                    child: Text(
                      widget.schoolName,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: w * 0.04,
                      ),
                    ),
                  ),
                  Text(
                    widget.location,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: w * 0.03,
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
            SizedBox(
              height: h * 0.06,
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.people_alt),
                title: const Text(Strings.student),
              ),
            ),
            SizedBox(
              height: h * 0.06,
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.person_rounded),
                title: const Text(Strings.teacher),
              ),
            ),
            SizedBox(
              height: h * 0.06,
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.person_rounded),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(Strings.academic),
                    IconButton(
                        onPressed: () {
                          academicSubIcon = !academicSubIcon;
                          setState(() {});
                        },
                        icon: const Icon(Icons.arrow_drop_down))
                  ],
                ),
              ),
            ),
            Visibility(
              visible: academicSubIcon,
              child: SizedBox(
                height: h * 0.06,
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 30),
                  onTap: () {},
                  leading: Image.asset(Paths.classesAndSectionIcon),
                  title: const Text(Strings.classesAndSection),
                ),
              ),
            ),
            Visibility(
              visible: academicSubIcon,
              child: SizedBox(
                height: h * 0.06,
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 30),
                  onTap: () {},
                  leading: Image.asset(Paths.subjectAssignToClassIcon),
                  title: const Text(Strings.subjectAssignToClass),
                ),
              ),
            ),
            Visibility(
              visible: academicSubIcon,
              child: SizedBox(
                height: h * 0.06,
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 30),
                  onTap: () {},
                  leading: Image.asset(Paths.holidaysIcon),
                  title: const Text(Strings.classesSchedule),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.06,
              child: ListTile(
                onTap: () {},
                leading: Image.asset(Paths.syllabusIcon),
                title: const Text(Strings.syllabus),
              ),
            ),
            SizedBox(
              height: h * 0.06,
              child: ListTile(
                onTap: () {},
                leading: Image.asset(Paths.attendanceIcon),
                title: const Text(Strings.attendance),
              ),
            ),
            SizedBox(
              height: h * 0.06,
              child: ListTile(
                onTap: () {},
                leading: Image.asset(Paths.holidaysIcon),
                title: const Text(Strings.holidays),
              ),
            ),
            SizedBox(
              height: h * 0.06,
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.push_pin),
                title: const Text(Strings.schoolBoard),
              ),
            ),
            SizedBox(
              height: h * 0.06,
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.calendar_month),
                title: const Text(Strings.calender),
              ),
            ),
            SizedBox(
              height: h * 0.06,
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.currency_rupee),
                title: const Text(Strings.subscription),
              ),
            ),
            SizedBox(
              height: h * 0.06,
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.output),
                title: const Text(Strings.exit),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

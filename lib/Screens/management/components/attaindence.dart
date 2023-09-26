import 'package:flutter/material.dart';

import '../constant/strings.dart';
import 'dropDownButton.dart';

class Attendance extends StatelessWidget {
  const Attendance(
      {super.key,
      required this.width,
      required this.height,
      required this.totalTeacher,
      required this.totalStudent,
      required this.totalAbsentTeacher,
      required this.totalAbsentStudent});
  final double width;
  final double height;
  final int totalTeacher;
  final int totalAbsentTeacher;
  final int totalStudent;
  final int totalAbsentStudent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              Strings.attendance,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: width * 0.9,
          height: 70,
          decoration: const BoxDecoration(
              color: Color(0xFFDED0F3),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    totalTeacher.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.05),
                  ),
                  Text(
                    Strings.totalTeacherAttendance,
                    style:
                        TextStyle(color: Colors.grey, fontSize: width * 0.03),
                  ),
                ],
              ),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (totalTeacher - totalAbsentTeacher).toString(),
                    style: TextStyle(
                        color: const Color(0xFF20A686),
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.05),
                  ),
                  Text(
                    Strings.present,
                    style:
                        TextStyle(color: Colors.grey, fontSize: width * 0.03),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    totalAbsentTeacher.toString(),
                    style: TextStyle(
                        color: const Color(0xFFD81159),
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.05),
                  ),
                  Text(
                    Strings.absent,
                    style:
                        TextStyle(color: Colors.grey, fontSize: width * 0.03),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          width: width * 0.9,
          height: 80,
          decoration: const BoxDecoration(
              color: Color(0xFFDED0F3),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: DropButton(
                  dropOption: ['Class VI', 'Class VII', 'Class vIII'],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        totalStudent.toString(),
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.05),
                      ),
                      Text(
                        Strings.totalStudentAttendance,
                        style: TextStyle(
                            color: Colors.grey, fontSize: width * 0.03),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (totalStudent - totalAbsentStudent).toString(),
                        style: TextStyle(
                            color: const Color(0xFF20A686),
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.05),
                      ),
                      Text(
                        Strings.present,
                        style: TextStyle(
                            color: Colors.grey, fontSize: width * 0.03),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        totalAbsentStudent.toString(),
                        style: TextStyle(
                            color: const Color(0xFFD81159),
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.05),
                      ),
                      Text(
                        Strings.absent,
                        style: TextStyle(
                            color: Colors.grey, fontSize: width * 0.03),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        )
      ],
    );
  }
}

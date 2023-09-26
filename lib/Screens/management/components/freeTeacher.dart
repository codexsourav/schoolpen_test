import 'package:flutter/material.dart';

import '../constant/strings.dart';

class FreeTeacher extends StatefulWidget {
  const FreeTeacher({super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  State<FreeTeacher> createState() => _OnGoingClassState();
}

class _OnGoingClassState extends State<FreeTeacher> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 10,
            ),
            const Text(
              Strings.freeTeacher,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text(
                Strings.viewAll,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color(0xFF9163D7),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        SizedBox(
          height: widget.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SizedBox(
                      width: widget.width * 0.01,
                    ),
                    Column(
                      children: [
                        Container(
                          width: widget.width * 0.22,
                          height: 35,
                          decoration: BoxDecoration(
                              color: const Color(0xFF9163D7),
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Text(
                              "${Strings.period} ${index + 1}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                          child: Text('08:00'), // Pass time here
                        )
                      ],
                    ),
                    SizedBox(
                      width: widget.width * 0.02,
                    ),
                    Container(
                      width: widget.width * 0.005,
                      height: 100,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: widget.width * 0.02,
                    ),
                    SizedBox(
                      width: widget.width * 0.725,
                      height: 80,
                      child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ClassesCard(
                            backGroundColor: Colors.white,
                            className: 'Class2-A',
                            subjectName: 'Science',
                            teacherImage: 'assets/profile.png',
                            teacherName: 'Shanti ',
                            width: widget.width,
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}

class ClassesCard extends StatelessWidget {
  const ClassesCard(
      {super.key,
      required this.backGroundColor,
      required this.className,
      this.subjectName = '',
      this.teacherName = '',
      this.teacherImage = '',
      required this.width});
  final Color backGroundColor;
  final String className;
  final String subjectName;
  final String teacherName;
  final String teacherImage;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 40,
      margin: const EdgeInsets.only(right: 10, bottom: 5),
      decoration: BoxDecoration(
          color: backGroundColor,
          border: Border.all(color: const Color(0xFF9163D7)),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Image.asset(teacherImage),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (teacherName == '') ? '-' : teacherName,
                style: TextStyle(
                    fontSize: width * 0.04,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                (subjectName == '') ? '-' : subjectName,
                style: TextStyle(fontSize: width * 0.03, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

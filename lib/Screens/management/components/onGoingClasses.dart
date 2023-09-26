import 'package:flutter/material.dart';

import '../constant/strings.dart';

class OnGoingClass extends StatefulWidget {
  const OnGoingClass({super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  State<OnGoingClass> createState() => _OnGoingClassState();
}

class _OnGoingClassState extends State<OnGoingClass> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Text(
              Strings.onGoingClass,
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
                            return const ClassesCard(
                              backGroundColor: Color(0xFFAEF0C3),
                              className: 'Class2-A',
                              subjectName: 'Science',
                              teacherImage: 'assets/teacherProfileImage.png',
                              teacherName: 'Shanti ',
                            );
                          }),
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
      this.teacherImage = ''});
  final Color backGroundColor;
  final String className;
  final String subjectName;
  final String teacherName;
  final String teacherImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      // height: 100,
      padding: const EdgeInsets.only(top: 5),
      margin: const EdgeInsets.only(right: 10, bottom: 5),
      decoration: BoxDecoration(
          color: backGroundColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Flexible(
                child: Text(
                  "$className | ${(subjectName == '') ? '-' : subjectName}",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 30,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(teacherImage))),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                (teacherName == '') ? '-' : teacherName,
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

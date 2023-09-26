import 'package:flutter/material.dart';

import 'package:schoolpenintern/Routes/app_routes.dart';
import 'package:schoolpenintern/Screens/Teacher/Components/custom_button.dart';
import 'package:schoolpenintern/Screens/Teacher/Theme/Colors/appcolors.dart';

class LectureCard extends StatelessWidget {
  const LectureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        color: AppColors.parentPrimaryLight,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Period 1"),
                Text("8:00- 8:40"),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Class V-C | ",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                  Text("Science",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text("Chapter 3: Geometry and its uses",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              subtitle: Text("View Lesson",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {},
                child: const RoundedButton(
                    text: Text("Start Class",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    width: 35,
                    height: 32,
                    bg: AppColors.parentPrimary),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

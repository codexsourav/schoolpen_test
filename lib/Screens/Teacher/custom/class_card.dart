import 'package:flutter/material.dart';
import 'package:schoolpenintern/Screens/Teacher/custom/strings.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Container(
              width: 170,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("assets/images/class_card_bg.png"),
                      fit: BoxFit.cover),
                  color: AppColors.parentPrimary,
                  borderRadius: BorderRadius.circular(25)),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      "Class IV-C",
                      style: TextStyle(fontSize: 16, color: AppColors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      "Science",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 35.0),
                    child: Text(
                      "42 Students",
                      style: TextStyle(fontSize: 12, color: AppColors.white),
                    ),
                  )
                ],
              )),
        ),
        CircleAvatar(
          backgroundColor: AppColors.white,
          radius: 42,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              radius: 42,
              backgroundImage: Image.asset(
                "assets/images/user1.png",
                fit: BoxFit.fill,
              ).image,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

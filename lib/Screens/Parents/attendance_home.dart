import 'package:flutter/material.dart';

import 'package:schoolpenintern/Routes/app_routes.dart';
import 'package:schoolpenintern/Screens/Teacher/Components/custom_button.dart';
import 'package:schoolpenintern/Screens/Teacher/Theme/Colors/appcolors.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.parentPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.parentPrimary,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.parentPrimary,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 28.0),
            child: Text(
              "Take Attendance",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white),
            ),
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 330,
                  height: 330,
                  margin: const EdgeInsets.only(top: 120),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  height: 280,
                  width: 330,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/attendance_asset.png",
                        fit: BoxFit.cover,
                      ),
                      InkWell(
                        onTap:(){},
                        child: const RoundedButton(
                            text: Text("Manual Attendance",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                            width: 60,
                            height: 40,
                            bg: AppColors.parentPrimary),
                      )
                    ],
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

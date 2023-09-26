import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:schoolpenintern/Providers/UserProfileProvider.dart';
import 'package:schoolpenintern/Screens/Profile/ViewProfile/view_parent_profile.dart';
import 'package:schoolpenintern/Screens/Profile/ViewProfile/view_student_profile.dart';
import 'package:schoolpenintern/Screens/Profile/ViewProfile/view_teacher_profile.dart';
import 'package:schoolpenintern/data/Network/config.dart';

import '../../../Theme/Colors/appcolors.dart';
import '../ChatRequest/RequestPage.dart';

AppBar chatHomeAppbar(context, role, image, uid) {
  return AppBar(
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        color: role == "student" ? AppColors.purple : AppColors.pinkDarkcolor,
      ),
    ),
    title: Text(
      "Chat",
      style: TextStyle(color: AppColors.graymdm, fontWeight: FontWeight.w400),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Get.to(RequestPage(
            id: uid,
          ));
        },
        icon: const Icon(Icons.notifications),
        color: role == "student" ? AppColors.purple : AppColors.pinkDarkcolor,
      ),
      const SizedBox(width: 20),
      GestureDetector(
        onTap: () {
          var role =
              Provider.of<UserProfileProvider>(context, listen: false).roal;
          if (role == 'student') {
            Get.to(ViewStudentProfile());
          } else if (role == 'teacher') {
            Get.to(ViewTeacherProfile());
          } else if (role == 'parent') {
            Get.to(ViewParentProfile());
          } else {
            Fluttertoast.showToast(msg: "I Dont Know Who Are You");
          }
        },
        child: Container(
          height: 35,
          width: 35,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "${Config.hostUrl}/static/" + image,
            ),
          ),
        ),
      ),
      const SizedBox(width: 20),
    ],
  );
}

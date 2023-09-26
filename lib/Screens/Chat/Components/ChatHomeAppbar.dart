import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      Container(
        height: 35,
        width: 35,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            image,
          ),
        ),
      ),
      const SizedBox(width: 20),
    ],
  );
}

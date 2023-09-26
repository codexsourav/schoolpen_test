import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppbarIconWidget extends StatelessWidget {
  const AppbarIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            "assets/images/student_section_images/homepage_images/header_images/search_icon.svg",
            width: 36,
          ),
          GestureDetector(
            onTap: () {
              // Get.to(() => ChatHomeScreen());
            },
            child: SvgPicture.asset(
              "assets/images/student_section_images/homepage_images/header_images/chat_icon.svg",
              width: 36,
            ),
          ),
          SvgPicture.asset(
            "assets/images/student_section_images/homepage_images/header_images/notification_icon.svg",
            width: 36,
          ),
        ],
      ),
    );
  }
}

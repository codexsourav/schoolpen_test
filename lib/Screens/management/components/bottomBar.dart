import 'package:flutter/material.dart';

import '../constant/strings.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
    required this.onHomeButton,
    required this.onSchoolButton,
    required this.onStudentButton,
    required this.onTeacherButton,
    this.selectedIconColor = Colors.deepPurple,
    this.unSelectedIconColor = Colors.black54,
  });
  final Function onHomeButton;
  final Function onSchoolButton;
  final Function onStudentButton;
  final Function onTeacherButton;
  final Color selectedIconColor;
  final Color unSelectedIconColor;
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        setState(() {
          currentIndexPage = index;
        });
        if (currentIndexPage == 0) {
          widget.onHomeButton();
        } else if (currentIndexPage == 1) {
          widget.onSchoolButton();
        } else if (currentIndexPage == 2) {
          widget.onStudentButton();
        } else {
          widget.onTeacherButton();
        }
      },
      currentIndex: currentIndexPage,
      selectedItemColor: widget.selectedIconColor,
      unselectedItemColor: widget.unSelectedIconColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
          ),
          label: Strings.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.school,
          ),
          label: Strings.feed,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.people_alt,
          ),
          label: Strings.student,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_rounded,
          ),
          label: Strings.profile,
        ),
      ],
    );
  }
}

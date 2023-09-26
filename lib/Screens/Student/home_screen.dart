import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:schoolpenintern/Screens/Parents/custom/drawer.dart';
import 'package:schoolpenintern/Screens/Student/student_homepage_widgets/appbar_icon_widget.dart';
import 'package:schoolpenintern/Screens/Student/student_homepage_widgets/student_custom_appbar_widget.dart';
import 'package:schoolpenintern/Screens/Student/student_homepage_widgets/student_drawer.dart';

import '../../Providers/UserProfileProvider.dart';
import 'student_homepage_widgets/calender_widget.dart';
import 'student_homepage_widgets/header_widget.dart';
import 'student_homepage_widgets/notice_widget.dart';
import 'student_homepage_widgets/syllabus_widget.dart';

class StudentHomeScreen extends StatefulWidget {
  final String role;
  const StudentHomeScreen({Key? key, required this.role}) : super(key: key);

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  bool showIcon = false;
  ScrollController scrollController = ScrollController();
  double scrollPosition = 0.0;
  final AdvancedDrawerController controller = AdvancedDrawerController();

  @override
  void initState() {
    scrollController.addListener(scrollListener);
    super.initState();
  }

  scrollListener() {
    setState(() {
      scrollPosition = scrollController.position.pixels;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    UserProfileProvider data = Provider.of<UserProfileProvider>(context);
    // print(data.profileData!.gender);
    return SafeArea(
      child: AdvancedDrawer(
        controller: controller,
        openScale: 0.7,
        openRatio: 0.65,
        disabledGestures: false,
        backdrop: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/images/student_drawer_background.png",
                fit: BoxFit.fill)),
        childDecoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        drawer: const StudentDrawerScreen(
          schoolName: "Teacher Name",
          location: '',
          profileImg: 'assets/images/parantsImage.png',
        ),
        child: Scaffold(
            body: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              flexibleSpace: scrollPosition >= 150
                  //if the scroll is more than 150 normal appbar will be displayed
                  //if it is less then 150 we will display the standard header with the text "Welcome back" and name
                  ? StudentCustomAppbarWidget(controller: controller)
                  : HeaderWidget(role: "student", drawerController: controller),
              pinned: true,
              floating: true,
              backgroundColor: Colors.white,
              expandedHeight: scrollPosition >= 150 ? 0 : 240,
            ),
            buildBody(),
          ],
        )),
      ),
    );
  }

  Widget buildBody() => const SliverToBoxAdapter(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // Divider(
            //   thickness: 5,
            // ),

            
            // GestureDetector(
            //   onTap: () async {},
            //   child: HeaderWidget(
            //     role: widget.role,
            //   ),
            // ),

            // LiveClassesWidget(),
            // SizedBox(
            //   height: 24,
            // ),
            // TodaysClassesWidget(),
            // SizedBox(
            //   height: 24,
            // ),
            // TomorrowsClassesWidget(),
            // SizedBox(
            //   height: 24,
            // ),
            // TeachersNote(
            //   description:
            //       "Bring practical notebook to the class, we will conduct some experiments tomorrow",
            // ),
            SizedBox(
              height: 24,
            ),
            CalenderWidget(
              date: "02",
              day: "Mon",
            ),
            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 100,
            ),
          ],
        ),
      ));
}

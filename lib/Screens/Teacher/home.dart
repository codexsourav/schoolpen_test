import 'package:calender_picker/date_picker_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schoolpenintern/Providers/UserProfileProvider.dart';
import 'package:schoolpenintern/Screens/Chat/ChatHome/ChatHomeScreen.dart';
import 'package:schoolpenintern/Screens/Student/student_homepage_widgets/calender_widget.dart';
import 'package:schoolpenintern/Screens/Teacher/custom/strings.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'Components/DynamicSliverAppBar.dart';
import 'Components/button.dart';
import 'TeacherDrawerScreen.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({super.key});

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {

  final CarouselController _controller = CarouselController();
  final ScrollController scrollController = ScrollController();
  final AdvancedDrawerController controller = AdvancedDrawerController();
  int itemCount = 4;
  bool hideBar = false;
  int currentPageToday = 0;
  int currentPageTommorow = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    String backgroundImageAsset =  "assets/images/bgteacher_top_background.svg";

    scrollController.addListener(() {
      if (scrollController.offset > 188) {
        hideBar = true;
        setState(() {
          backgroundImageAsset = "assets/images/parent_bg.png";

        });
      } else {
        hideBar = false;
        setState(() {
          backgroundImageAsset = "assets/images/bgteacher_top_background.svg";
        });
      }
    });
    UserProfileProvider dataProvider =
        Provider.of<UserProfileProvider>(context);

    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: AdvancedDrawer(
          controller: controller,
          openScale: 0.7,
          openRatio: 0.65,
          disabledGestures: false,
          backdrop: SizedBox(
          width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child:
    Image.asset("assets/images/parent_drawer_bg.png", fit: BoxFit.fill)),
    childDecoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    drawer: const TeacherDrawerScreen(
    schoolName: "Stonehill International",
    location: '',
    profileImg: 'assets/images/parantsImage.png',
    ),
    child:Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            iconSize: 25,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.parentPrimary,
            onTap: (value) {},
            unselectedItemColor: AppColors.black.withOpacity(0.5),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: "Explore",
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: "Classwork",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.videocam),
                label: "Courses",
              ),
            ],
          ),
          body: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(

                collapsedHeight: 90,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                leading: IconButton(
                  onPressed: () {
                    controller.showDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                toolbarHeight: 70,
                actions: hideBar
                    ? [
                  const Spacer(),
                  CircleAvatarButton(
                    iconData: Icons.search,
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CircleAvatarButton(
                    iconData: Icons.messenger,
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CircleAvatarButton(
                    iconData: Icons.notifications,
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const CircleAvatar(
                    backgroundImage:
                    AssetImage('assets/stone_hill_logo.png'),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                ]
                    : [],
                expandedHeight: 300,
                pinned: true,
                flexibleSpace:
                  Stack(
                    children: [
                      // Positioned.fill(child: Image.asset(backgroundImageAsset)),
                      SvgPicture.asset(
                        backgroundImageAsset,
                        height: 300,
                        width: screenWidth,
                        fit: BoxFit.cover,
                      ),
                      // SvgPicture.asset(
                      //   "assets/images/bgteacher_top_background.svg",
                      //   width: screenWidth,
                      //   fit: BoxFit.cover,
                      // ),
                      // Positioned(
                      //   top: 45,
                      //   left: 20,
                      //   child: SvgPicture.asset(
                      //     "assets/images/bgteacher_top_background.svg",
                      //     width: 30,
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      Positioned(
                        top: 100,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // value.userlogout();
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      // "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
                                      "https://m.media-amazon.com/images/I/41EvGpCFECL._AC_UF1000,1000_QL80_.jpg",
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Welcome back",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Consumer<UserProfileProvider>(
                                        builder: (context, value, child) {
                                          return Text(
                                            "Rishabh",
                                            // value.profileData!.username.toString() ?? "",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700),
                                          );
                                        })
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              width: 140,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: AppColors.parentPrimaryLight,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      var teacherdata = Provider.of<UserProfileProvider>(
                                        context,
                                        listen: false,
                                      ).teacherdata;
                                      Get.to(() => ChatHomeScreen(
                                        role: "student",
                                        myid: teacherdata!.sId.toString(),
                                      ));
                                    },
                                    child: Icon(
                                      Icons.messenger,
                                      color: AppColors.parentPrimaryLight,
                                    ),
                                  ),
                                  Icon(
                                    Icons.notifications,
                                    color: AppColors.parentPrimaryLight,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              // ),
              buildBody(),
            ],
          )

    )),

        ));
  }

  Widget buildBody() => SliverToBoxAdapter(

        child: Stack(
          children:[ Padding(
            padding: const EdgeInsets.only(top:40, left: 20),

            child: Image.asset("assets/teacherbg.png"),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 90,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      printmonth(DateTime.now().toString().substring(5, 7)) +
                          " " +
                          DateTime.now().toString().substring(0, 4),
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: CalenderPicker(
                  DateTime.now(),
                  dayTextStyle: GoogleFonts.poppins(),
                  dateTextStyle: GoogleFonts.poppins(fontSize: 18),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Color(0xFFC45162),
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {});
                  },
                  width: 70,
                  height: 75,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Center(
                  child: ToggleSwitch(
                    radiusStyle: true,
                    borderColor: [Color(0xFFC45162)],
                    borderWidth: 0,
                    minWidth: MediaQuery.of(context).size.width * 0.87,
                    minHeight: 50.0,
                    initialLabelIndex: 0,
                    cornerRadius: 30,
                    activeBgColor: [Color(0xFFC45162)],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.white,
                    inactiveFgColor: Color(0xFFC45162),
                    totalSwitches: 3,
                    customTextStyles: [
                      GoogleFonts.lato(
                          fontWeight: FontWeight.w500, fontSize: 18)
                    ],
                    labels: ["Events", "Task", "Birthdays"],
                    onToggle: (index) {},
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                height: 68,
                width: MediaQuery.of(context).size.width - 30,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                          color: Color(0xFFFCDEBD),
                          borderRadius: BorderRadius.circular(16)),
                      height: 60,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 23.4),
                            child: Column(
                              children: [
                                Text(
                                  "08",
                                  style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      color: Color(0xFFF38E20),
                                      fontWeight: FontWeight.bold),
                                  // style: TextStyle(
                                  //     fontSize: 24,
                                  //     color: Color(0xFFF38E20),
                                  //     fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "July",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Color(0xFFF38E20),
                                      fontWeight: FontWeight.bold),
                                  // style: TextStyle(
                                  //     fontSize: 24,
                                  //     color: Color(0xFFF38E20),
                                  //     fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 14.6, top: 3, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Annual Sports Meet",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/student_section_images/homepage_images/calender_images/clock_icon.svg",
                                      width: 16,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "14:00 - 15:00",
                                      style:
                                          TextStyle(color: Color(0xFF707070)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 30,
                      child: SvgPicture.asset(
                        "assets/images/student_section_images/homepage_images/calender_images/yellow_bell_icon.svg",
                        width: 24,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 68,
                width: MediaQuery.of(context).size.width - 30,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                          color: Color(0xFFD8F3FE),
                          borderRadius: BorderRadius.circular(16)),
                      height: 60,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 23.4),
                            child: Column(
                              children: [
                                Text(
                                  "08",
                                  style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      color: Color(0xFF7CD6FB),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "July",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Color(0xFF7CD6FB),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 14.6, top: 3, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Award Ceremony",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/student_section_images/homepage_images/calender_images/clock_icon.svg",
                                      width: 16,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "All Day",
                                      style:
                                          TextStyle(color: Color(0xFF707070)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 30,
                      child: SvgPicture.asset(
                        "assets/images/student_section_images/homepage_images/calender_images/blue_bell_icon.svg",
                        width: 24,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                width: 180,
                height: 50,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "+ Create task",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  color: Color(0xFFC45162),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              )
            ],
          ),
        ]),
      );
}

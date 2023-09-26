import 'package:calender_picker/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schoolpenintern/Screens/StartupDashBord/constants/ConstantColors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({
    super.key,
    required this.day,
    required this.date,
  });

  final String day;
  final String date;

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  @override
  Widget build(BuildContext context) {
    final days_array = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                printmonth(DateTime.now().toString().substring(5,7))+" "+DateTime.now().toString().substring(0,4),
                style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),
              ),
              SvgPicture.asset(
                  "assets/images/student_section_images/homepage_images/calender_images/calender_icon_purple.svg")
            ],
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:20),
              child: SvgPicture.asset(
                "assets/images/student_section_images/homepage_images/calender_images/calender_background_purple.svg",
                width: screenWidth,
                
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: CalenderPicker(
                     
                    DateTime.now(),
                    dayTextStyle: GoogleFonts.poppins(),
                    dateTextStyle:GoogleFonts.poppins(fontSize: 18),
                    initialSelectedDate: DateTime.now(),
                    
                    selectionColor: Color(0xFF9163D7),
                    selectedTextColor: Colors.white,
                    
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        
                      });
                    },
                    width: 70,
                    height: 75,
                  ),
                ),
                Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: Center(
                child: ToggleSwitch(
                 
                  radiusStyle: true,
                  borderColor: [ConstantColors.buttonClr],
                  borderWidth: 0,
                  minWidth: MediaQuery.of(context).size.width * 0.87,
                  minHeight: 50.0,
                  initialLabelIndex: 0,
                  cornerRadius: 30,
                  activeBgColor: [ConstantColors.buttonClr],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  inactiveFgColor: ConstantColors.buttonClr,
                  totalSwitches: 3,
                  customTextStyles: [
                    GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 18)
                  ],
                  labels: ["Events", "Task","Birthdays"],
                  onToggle: (index) {
                    
                  },
                ),
              ),
            ),
                
                SizedBox(
                  height: 14,
                ),
                Container(
                  height: 68,
                  width: screenWidth - 30,
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
                                    style: GoogleFonts.poppins(fontSize: 24,color: Color(0xFFF38E20),fontWeight: FontWeight.bold),
                                    // style: TextStyle(
                                    //     fontSize: 24,
                                    //     color: Color(0xFFF38E20),
                                    //     fontWeight: FontWeight.bold),
                                  ),
                                   Text(
                                    "July",
                                    style: GoogleFonts.poppins(fontSize: 12,color: Color(0xFFF38E20),fontWeight: FontWeight.bold),
                                    // style: TextStyle(
                                    //     fontSize: 24,
                                    //     color: Color(0xFFF38E20),
                                    //     fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 14.6, top: 3, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                  width: screenWidth - 30,
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
                                    style: GoogleFonts.poppins(fontSize: 24,color: Color(0xFF7CD6FB),fontWeight: FontWeight.bold),
                                    // style: TextStyle(
                                    //     fontSize: 24,
                                    //     color: Color(0xFFF38E20),
                                    //     fontWeight: FontWeight.bold),
                                  ),
                                   Text(
                                    "July",
                                    style: GoogleFonts.poppins(fontSize: 12,color: Color(0xFF7CD6FB),fontWeight: FontWeight.bold),)
                                  // Text(
                                  //   "08",
                                  //   style: TextStyle(
                                  //       fontSize: 24,
                                  //       color: Color(0xFF7CD6FB),
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  // Text(
                                  //   "July",
                                  //   style: TextStyle(
                                  //       fontSize: 12,
                                  //       color: Color(0xFF7CD6FB),
                                  //       fontWeight: FontWeight.bold),
                                  // )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 14.6, top: 3, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  width: 180,
                  height: 50,
                  child: MaterialButton(onPressed: (){
                
                
                  }
                  ,child: Text("+ Create task",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),),color:Color(0xFF9163D7),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),),
                )
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Padding(
                //       padding: EdgeInsets.only(left: 10, right: 10),
                //       child: Text(
                //         "+ Create task",
                //         style: TextStyle(color: Colors.white),
                //       )),
                //   style: ButtonStyle(
                    
                //     fixedSize: MaterialStateProperty.all(Size(185, 50)),
                //     backgroundColor:
                //         MaterialStateProperty.all(Color(0xFF9163D7)),
                //     elevation: MaterialStateProperty.all(0),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

String printmonth(String substring) {
  switch (substring) {
    case "01":
      return "January";
    case "02":
      return "February";
    case "03":
      return "March";
    case "04":
      return "April";
    case "05":
      return "May";
    case "06":
      return "June";
    case "07":
      return "July";
    case "08":
      return "August";
    case "09":
      return "September";
    case "10":
      return "October";
    case "11":
      return "November";
    default:
      return "December";
  }
}

class SingleDateWidget extends StatelessWidget {
  final String date;
  final String day;
  const SingleDateWidget({
    Key? key,
    required this.date,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 64,
      width: 50,
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(50),
      //     color: const Color(0xFF9163D7)),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(fontSize: 10),
          ),
          Text(date,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

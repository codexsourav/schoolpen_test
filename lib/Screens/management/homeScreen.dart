// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:schoolpenintern/Screens/management/components/attaindence.dart';
// import 'package:schoolpenintern/Screens/management/components/freeClass.dart';
// import 'package:schoolpenintern/Screens/management/components/freeTeacher.dart';
// import 'package:schoolpenintern/Screens/management/components/graph.dart';
// import 'package:schoolpenintern/Screens/management/components/onGoingClasses.dart';
// import 'package:schoolpenintern/Screens/management/constant/colors.dart';
// import 'package:schoolpenintern/Screens/management/constant/strings.dart';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   //final HomeScreenBloc homeScreenBloc = HomeScreenBloc();
//   final TextEditingController _controller = TextEditingController();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//    // homeScreenBloc.add(CheckKeyEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     double h = MediaQuery.of(context).size.height;
//     return BlocProvider(
//      // create: (_) => homeScreenBloc,
//       child: BlocListener<HomeScreenBloc, InitialHomeStates>(
//         listener: (context, state) {
//           if (state is CheckKeyState) {
//             showDialog(
//               context: context,
//               builder: (ctx) => Dialog(
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20))),
//                 child: Container(
//                   height: 300,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: Column(
//                     children: [
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Text(
//                         Strings.enterLicenseKey,
//                         style: TextStyle(
//                             color: AppColors.parentDarkcolor,
//                             fontSize: w * 0.05,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(left: 20, right: 20),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             color: Colors.deepPurple.shade50,
//                             border:
//                                 Border.all(color: AppColors.parentDarkcolor)),
//                         child: TextField(
//                           controller: _controller,
//                           textAlign: TextAlign.center,
//                           decoration: InputDecoration(
//                             hintText: 'Please Enter Key',
//                             hintStyle: TextStyle(
//                                 color: Colors.grey, fontSize: w * 0.04),
//                             border: InputBorder.none,
//                             suffixIcon: IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.check_circle_outline,
//                                 color: AppColors.parentDarkcolor,
//                                 size: 30,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(left: 10, right: 10),
//                         padding: const EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF9163D7),
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                         child: const Center(
//                           child: Text(
//                             'Submit',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                       const Text(Strings.enterLicenseKeySuggestion)
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//         },
//         child: Column(
//           children: [
//             const LineChartSample1(),
//             OnGoingClass(
//               height: h * 0.3,
//               width: w,
//             ),
//             FreeClass(height: h * 0.3, width: w),
//             FreeTeacher(height: h * 0.3, width: w),
//             Attendance(
//               width: w,
//               height: h,
//               totalTeacher: 33,
//               totalStudent: 48,
//               totalAbsentTeacher: 5,
//               totalAbsentStudent: 12,
//             ),
//             // const CalenderWidget(
//             //   day: 'Mon',
//             //   date: '05',
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }

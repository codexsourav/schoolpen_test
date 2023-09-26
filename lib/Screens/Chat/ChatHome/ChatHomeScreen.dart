import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:schoolpenintern/Screens/Chat/Components/ChatuserListBox.dart';
import 'package:schoolpenintern/Screens/Chat/Components/Searchusers.dart';
import 'package:schoolpenintern/Theme/Colors/appcolors.dart';
import 'package:http/http.dart' as http;
import '../../../Providers/ChatUserProvider.dart';
import '../Components/ChatHomeAppbar.dart';
import 'tabs/ParentTab.dart';
import 'tabs/StudentsTab.dart';
import 'tabs/TeacherTab.dart';

class ChatHomeScreen extends StatefulWidget {
  final String role;
  final String myid;
  final String image;
  final String myuserid;

  const ChatHomeScreen(
      {super.key,
      this.role = "",
      this.image = "",
      required this.myuserid,
      required this.myid});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  @override
  void initState() {
    Provider.of<ChatUserProvider>(context, listen: false)
        .setChatUsers(widget.myuserid);
    super.initState();
  }

// For Tab Index
  int tabindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          chatHomeAppbar(context, widget.role, widget.image, widget.myuserid),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print(widget.myuserid);
                          Get.to(SearchUsers(
                            myid: widget.myuserid,
                            role: widget.role,
                          ));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width - 78,
                          height: 50,
                          padding: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              width: 1.5,
                              color: widget.role == "student"
                                  ? AppColors.purple
                                  : AppColors.pinkDarkcolor,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 25,
                                color: widget.role == "student"
                                    ? AppColors.purple
                                    : AppColors.pinkDarkcolor,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 14),
                                child: Text(
                                  "Search Classmeat And Teacher...",
                                  style: TextStyle(color: Colors.black26),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert_rounded),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  FlutterToggleTab(
                    width: 90,
                    isScroll: false,
                    borderRadius: 50,
                    selectedBackgroundColors: [
                      widget.role == "student"
                          ? AppColors.purple
                          : AppColors.pinkDarkcolor
                    ],
                    isShadowEnable: false,
                    selectedTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    unSelectedTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    labels: const ["All", "Students", "Teacher", "Parent"],
                    selectedIndex: tabindex,
                    unSelectedBackgroundColors: [
                      widget.role == "student"
                          ? const Color.fromARGB(255, 216, 185, 238)
                          : const Color.fromARGB(255, 207, 120, 136)
                    ],
                    selectedLabelIndex: (index) {
                      setState(() {
                        tabindex = index;
                      });
                      switch (index) {
                        case 0:
                          Provider.of<ChatUserProvider>(context, listen: false)
                              .resetChatUsers();
                          break;
                        case 1:
                          Provider.of<ChatUserProvider>(context, listen: false)
                              .sortsetChatUsers('student');
                          break;
                        case 2:
                          Provider.of<ChatUserProvider>(context, listen: false)
                              .sortsetChatUsers('teacher');
                          break;
                        case 3:
                          Provider.of<ChatUserProvider>(context, listen: false)
                              .sortsetChatUsers('parent');
                          break;
                        default:
                          Provider.of<ChatUserProvider>(context, listen: false)
                              .resetChatUsers();
                          break;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Consumer<ChatUserProvider>(
                        builder: (context, value, child) {
                          return Column(
                            children: [
                              value.loading
                                  ? SizedBox(
                                      height: 200,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: widget.role == "student"
                                              ? AppColors.purple
                                              : AppColors.pinkDarkcolor,
                                        ),
                                      ),
                                    )
                                  : value.listchatUsers == null
                                      ? SizedBox(
                                          height: 80,
                                          child: Center(
                                            child: Text("Let`s Start Chat"),
                                          ),
                                        )
                                      : Builder(
                                          builder: (context) {
                                            if (tabindex == 1) {
                                              return Column(
                                                children: [
                                                  ...List.generate(
                                                    value.student!.length,
                                                    (index) => LoadStudentTab(
                                                      chatuserId:
                                                          value.student![index],
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else if (tabindex == 2) {
                                              return Column(children: [
                                                ...List.generate(
                                                  value.teacher!.length,
                                                  (index) => TeacherTab(
                                                    chatuserId:
                                                        value.teacher![index],
                                                  ),
                                                ),
                                              ]);
                                            } else if (tabindex == 3) {
                                              return Column(children: [
                                                ...List.generate(
                                                  value.parent!.length,
                                                  (index) => ParentTab(
                                                    chatuserId:
                                                        value.parent![index],
                                                  ),
                                                ),
                                              ]);
                                            } else {
                                              return Column(
                                                children: List.generate(
                                                  value.listchatUsers!.length,
                                                  (index) => ChatUserListBox(
                                                    chatuserId: value
                                                        .listchatUsers![index],
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        )
                            ],
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: widget.role == "student"
              ? AppColors.purple
              : AppColors.pinkDarkcolor,
          onPressed: () {
            Get.to(SearchUsers(
              myid: widget.myuserid,
              role: widget.role,
            ));
          },
          child: const Icon(Icons.chat_bubble),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';
import 'package:schoolpenintern/Screens/Chat/Components/ChatuserListBox.dart';
import 'package:schoolpenintern/Screens/Chat/Components/Searchusers.dart';
import 'package:schoolpenintern/Theme/Colors/appcolors.dart';
import 'package:http/http.dart' as http;
import 'package:schoolpenintern/data/Network/config.dart';
import '../Components/ChatHomeAppbar.dart';

class ChatHomeScreen extends StatefulWidget {
  final String role;
  final String myid;
  final String image;

  const ChatHomeScreen(
      {super.key, this.role = "", this.myid = "", this.image = ""});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  @override
  void initState() {
    get_user();
    super.initState();
  }

// For Tab Index
  int tabindex = 0;

  List? teachers;
  Future get_user() async {

    http.Response res =
        await http.get(Uri.parse("${Config.hostUrl}/get_teachers_profile"));
    setState(() {
      teachers = jsonDecode(res.body);
      print(teachers);

    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.myid);
    return Scaffold(
      appBar: chatHomeAppbar(context, widget.role, widget.image, widget.myid),
      body: Column(
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
                        Get.to(SearchUsers(
                          myid: widget.myid,
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
                  labels: const ["All", "Students", "Teachers"],
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
                  },
                ),
                const SizedBox(height: 20),
                teachers == null
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
                    : Column(
                        children: List.generate(
                          teachers!.length,
                          (index) => ChatUserListBox(
                            chatuserId: teachers![index]['username'],
                            // myid: widget.myid,
                            // typename: teachers![index]["role"],
                            // name: teachers![index]['username'],
                            // // ignore: prefer_interpolation_to_compose_strings
                            // imageurl: "${Config.hostUrl}/static/" +
                            //     teachers![index]['user_image'],
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
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
              myid: widget.myid,
              role: widget.role,
            ));
          },
          child: const Icon(Icons.chat_bubble),
        ),
      ),
    );
  }
}

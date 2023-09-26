//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:schoolpenintern/Components/Abhil_widgets/about_card.dart';
import 'package:schoolpenintern/Components/Vishwajeet_widgets/profile_card.dart';
import 'package:schoolpenintern/Providers/UserProfileProvider.dart';
import 'package:schoolpenintern/Providers/models/ParentProfilemoadels.dart';
import 'package:schoolpenintern/Providers/models/StudentProfilemodels.dart';
import 'package:schoolpenintern/Screens/Parents/Components/Abhil_widgets/status_card.dart';

import 'package:schoolpenintern/Screens/Profile/ViewProfile/Constents.dart';
import 'package:schoolpenintern/data/Network/config.dart';

import 'package:http/http.dart' as http;

import 'models/TeacherMoadel.dart';

class ViewUserProfile extends StatefulWidget {
  final String userid;
  final String role;

  const ViewUserProfile({super.key, required this.userid, required this.role});

  @override
  State<ViewUserProfile> createState() => _ViewUserProfileState();
}

class _ViewUserProfileState extends State<ViewUserProfile> {
  late StudentProfileModel studentData;
  late ParentProfileModel parentData;
  late TeacherData teacherData;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  String roal = "student";
  bool loading = true;

  final int tabindex = 0;

  getUser() async {
    setState(() {
      loading = true;
    });
    Uri url;
    if (widget.role == "student") {
      url = Uri.parse('${Config.hostUrl}/get_user/${widget.userid}');
    } else if (widget.role == "teacher") {
      url = Uri.parse('${Config.hostUrl}/get_teacher/${widget.userid}');
    } else if (widget.role == "parent") {
      url = Uri.parse('${Config.hostUrl}/parent_data/${widget.userid}');
    } else {
      return false;
    }

    var req = http.MultipartRequest('GET', url);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();
    print(resBody);
    if (res.statusCode >= 200 && res.statusCode < 300) {
      if (widget.role == 'student') {
        studentData = StudentProfileModel.fromJson(jsonDecode(resBody));
      } else if (widget.role == "teacher") {
        teacherData = TeacherData.fromJson(jsonDecode(resBody));
      } else if (widget.role == 'parent') {
        parentData = ParentProfileModel.fromJson(jsonDecode(resBody));
      } else {
        Fluttertoast.showToast(msg: "User Not Found");
      }
      setState(() {
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
      print(res.reasonPhrase);
      Fluttertoast.showToast(msg: "User Not Not Load Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: loading
            ? SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: Center(
                  child: CircularProgressIndicator(
                    color: viewProfileTabs[widget.role]['darkcolor'],
                  ),
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Column(
                  children: [
                    Builder(
                      builder: (context) {
                        if (widget.role == 'student') {
                          return ProfileCard(
                            backGroundColor: viewProfileTabs[widget.role]
                                ['bgcolor'],
                            userName: studentData.userId.toString(),
                            image: Config.hostUrl +
                                "/static/" +
                                studentData.userImage.toString(),
                            buttonColor: viewProfileTabs[roal]['darkcolor'],
                            isStudent: (widget.role == "student"),
                            onCall: () {},
                            onMessage: () {},
                            std: studentData.userClass.toString(),
                          );
                        } else if (widget.role == "parent") {
                          return ProfileCard(
                            backGroundColor: viewProfileTabs[roal]['bgcolor'],
                            userName: parentData.parentUseridname.toString(),
                            image: Config.hostUrl +
                                "/static/" +
                                parentData.parentImage.toString(),
                            buttonColor: viewProfileTabs[roal]['darkcolor'],
                            isStudent: (widget.role == "student"),
                            onCall: () {},
                            onMessage: () {},
                            std: "",
                          );
                        } else if (widget.role == 'teacher') {
                          return ProfileCard(
                            backGroundColor: viewProfileTabs[widget.role]
                                ['bgcolor'],
                            userName: teacherData.useridName.toString(),
                            image: Config.hostUrl +
                                "/static/" +
                                teacherData.userImage.toString(),
                            buttonColor: viewProfileTabs[widget.role]
                                ['darkcolor'],
                            isStudent: (widget.role == "student"),
                            onCall: () {},
                            onMessage: () {},
                            std: teacherData.languages.toString(),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Builder(
                      builder: (context) {
                        if (widget.role == "student") {
                          return StatusCard(
                            headline: studentData.statusTitle.toString(),
                            description:
                                studentData.statusDescription.toString(),
                            bgcolor: viewProfileTabs[widget.role]['bgcolor'],
                            isedit: false,
                          );
                        } else if (widget.role == 'teacher') {
                          return StatusCard(
                            headline:
                                teacherData.status!.userDesignation.toString(),
                            description:
                                teacherData.status!.userDescription.toString(),
                            bgcolor: viewProfileTabs[widget.role]['bgcolor'],
                            isedit: false,
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    const SizedBox(height: 20),

// About Section
                    Builder(
                      builder: (context) {
                        if (widget.role == "student") {
                          return AboutCard(
                            bgcolor: viewProfileTabs[widget.role]['bgcolor'],
                            description:
                                studentData.personalInfo!.about.toString(),
                          );
                        } else if (widget.role == "parent") {
                          return AboutCard(
                            bgcolor: viewProfileTabs[widget.role]['bgcolor'],
                            description:
                                parentData.parentDesignation.toString(),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

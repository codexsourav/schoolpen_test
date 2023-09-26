//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:schoolpenintern/Providers/UserProfileProvider.dart';
import 'package:schoolpenintern/Screens/Chat/ChatHome/ChatHomeScreen.dart';
import 'package:schoolpenintern/Screens/Profile/ViewProfile/Constents.dart';
import 'package:schoolpenintern/data/Network/config.dart';

import '../../../Components/Abhil_widgets/about_card.dart';
import '../../../Components/Abhil_widgets/status_card.dart';
import '../../../Components/Abhil_widgets/tile_widget.dart';
import '../../../Components/Sourav_widgets/invite_parents.dart';
import '../../../Components/Sourav_widgets/student_parent_box.dart';
import '../../../Components/Sourav_widgets/user_contact_info_box.dart';
import '../../../Components/Sourav_widgets/user_idinfo_box.dart';
import '../../../Components/Vishwajeet_widgets/profile_card.dart';

class ViewParentProfile extends StatelessWidget {
  ViewParentProfile({super.key});
  String roal = "Student";
  final int tabindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<UserProfileProvider>(
                builder: (context, userdata, child) {
                  return Column(
                    children: [
                      // Viswajieet Eiget Start
                      // Search(
                      //   controller: _controller,
                      //   backGroundLightColor: viewProfileTabs[roal]['bgcolor'],
                      //   searchIconColor: viewProfileTabs[roal]['darkcolor'],
                      //   onTap: searchStudent,
                      //   onEditingComplete: searchStudent,
                      // ),
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          // Profile Card Here ==============
                          ProfileCard(
                            backGroundColor: viewProfileTabs[roal]['bgcolor'],
                            userName: userdata.parentprofile!.parentUseridname
                                .toString(),
                            isStudent: false,
                            std: "Parent".toString(),
                            buttonColor: viewProfileTabs[roal]['darkcolor'],
                            onCall: () {},
                            onMessage: () {
                              Get.to(() => ChatHomeScreen(role: "parent"));
                            },
                            image:
                                "${Config.hostUrl}/static/${userdata.parentprofile!.parentImage}",
                          ),
                          // Viswajieet Widgets End

                          // Abhill Widgets Start====
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Tabs  Here ==============
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ...List.generate(
                                      viewProfileTabs[roal]['tabs'].length,
                                      (index) {
                                        var tabdata = viewProfileTabs[roal]
                                            ['tabs'][index];
                                        return TileWidget(
                                          text: tabdata['tabtitle'],
                                          active: index == tabindex,
                                          activeTextColor: viewProfileTabs[roal]
                                              ['darkcolor'],
                                          activeColor: viewProfileTabs[roal]
                                              ['darkcolor'],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              // const SizedBox(height: 20),
                              // Status Card Here ==============
                              // StatusCard(
                              //     bgcolor: viewProfileTabs[roal]['bgcolor'],
                              //     headline: userdata.parentprofile!.personalInfo.s
                              //         .toString(),
                              //     description: userdata
                              //         .parentprofile!.statusDescription
                              //         .toString()),
                              const SizedBox(height: 20),
                              // About Card Here ==============
                              AboutCard(
                                bgcolor: viewProfileTabs[roal]['bgcolor'],
                                description: userdata
                                    .parentprofile!.personalInfo!.parentAbout
                                    .toString(),
                              )
                            ],
                          ),
                          // Abhill Widgets End====

                          // Sourav Widgets Start====
                          const SizedBox(height: 20),
                          // UserIDPass Card Here ==============
                          UserIdInfo(
                            onEditClick: () {},
                            userIdText: userdata.parentprofile!.parentUseridname
                                .toString(),
                            backgroundColor: viewProfileTabs[roal]['bgcolor'],
                          ),
                          const SizedBox(height: 20),
                          // User Contact Card Here ==============
                          UserConatctBox(
                            backgroundColor: viewProfileTabs[roal]['bgcolor'],
                            onEditClick: () {},
                            emailText: userdata.parentprofile!.personalInfo!
                                .contact!.parentEmail
                                .toString(),
                            phoneText:
                                "+91 ${userdata.parentprofile!.personalInfo!.contact!.parentPhone}",
                            locationAddress: "Just Show",
                          ),
                          const SizedBox(height: 20),

                          // Parent Card Here ==============
                          // No Paraents Data Found ???
                          UserParentsBox(
                            title: "Kids Detail",
                            data: [],
                            bgcolor: viewProfileTabs[roal]['bgcolor'],
                            darkcolor: viewProfileTabs[roal]['darkcolor'],
                          ),
                          const SizedBox(height: 20),

                          // Invite Card Here ==============
                          // inviteParents(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}

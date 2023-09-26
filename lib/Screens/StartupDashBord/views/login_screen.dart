import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schoolpenintern/Screens/Parents/parent_home.dart';
import 'package:schoolpenintern/Screens/Student/home_screen.dart';
import 'package:schoolpenintern/Screens/Teacher/home.dart';
import 'package:schoolpenintern/Screens/management/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Providers/UserProfileProvider.dart';
import '../../../data/Network/api_network.dart';
import '../../Profile/ViewProfile/view_parent_profile.dart';
import '../Models/signup_model.dart';
import '../utils/Common_widgets.dart';
import '../utils/client.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController userIdController = TextEditingController();
  TextEditingController passWdController = TextEditingController();
  ProfileController profileController = ProfileController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/initimages/background_2.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04),
              child: Text(
                "Login to the App",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: Color(0xff9163D7),
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
              child: Center(
                  child: CommonTextfield(
                type: "normal",
                Text: "Enter your UserID",
                inputcontroller: userIdController,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: Center(
                child: CommonTextfield(
                  type: "pwd",
                  Text: "Enter your password",
                  inputcontroller: passWdController,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: Center(
                child: CustomButton(
                    callback: () async {
                      signupModel? data = await profileController.logIn(context,
                          userIdController.text, passWdController.text);
                      if (data != null) {
                        // return false;
                        if (data.role == "student") {
                          //Fluttertoast.showToast(msg: 'Student');
                          try {
                            var res = await ApiNetwork.sendGetRequest(
                                'get_user/${data.userId}');
                            print(res);
                            // ignore: use_build_context_synchronously
                            Provider.of<UserProfileProvider>(context,
                                    listen: false)
                                .setProfileData(res);

                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString("roal", "student");
                            prefs.setString("user_id", res['user_id']);

                            Get.offAll(const StudentHomeScreen(
                              role: "student",
                            ));
                          } catch (e) {
                            print(e);
                            Fluttertoast.showToast(
                                msg: "Internal Server Error");
// >>>>>>> maste
                          }
                        } else if (data.role == "teacher") {
                          try {
                            var res = await ApiNetwork.sendGetRequest(
                                'get_teacher/${data.userId}');
                            // ignore: use_build_context_synchronously
                            Provider.of<UserProfileProvider>(context,
                                    listen: false)
                                .setTeacherData(res);
                            Get.offAll(TeacherHomePage());
                            print(res);
                          } catch (e) {
                            print(e);
                            Fluttertoast.showToast(
                                msg: "Internal Server Error");
                          }
                        } else if (data.role == "parent") {
                          // ParentHomePage

                          try {
                            var res = await ApiNetwork.sendGetRequest(
                                'parent_data/${data.userId}');
                            // ignore: use_build_context_synchronously
                            Provider.of<UserProfileProvider>(context,
                                    listen: false)
                                .setParentData(res);
                            Get.offAll(const ParentHomePage());
                            print(res);
                          } catch (e) {
                            print(e);
                            Fluttertoast.showToast(
                                msg: "Internal Server Error");
                          }

                          // Fluttertoast.showToast(
                          //     msg: 'Parent screen not implemented');
                        } else {
                          Fluttertoast.showToast(msg: 'Login error');
                        }
                      } else {
                        Fluttertoast.showToast(msg: 'Invalid Credentials');
                      }
                    },
                    text: "Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

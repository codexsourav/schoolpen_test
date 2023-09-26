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
                        var role = await profileController.logIn(context,
                            userIdController.text, passWdController.text);
                        if (role == "student") {
                          //Fluttertoast.showToast(msg: 'Student');
                          Get.offAll(() => StudentHomeScreen(
                                role: role,
                              ));
                        } else if (role == "teacher") {
                          // Fluttertoast.showToast(msg: 'Teacher');
                          Get.offAll(() => TeacherHomePage());
                        } else if (role == "parent") {
                          Get.to(() => HomePage());
                        } else {
                          Fluttertoast.showToast(msg: 'Login error');
                        }
                      },
                      text: "Login")),
            )
          ],
        ),
      ),
    );
  }
}

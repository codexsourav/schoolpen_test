
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schoolpenintern/Screens/management/service/http_service.dart';
import 'package:velocity_x/velocity_x.dart';

class VerifyEmail extends StatefulWidget {
  String email;
  VerifyEmail({super.key, required this.email});

  static const String routeName = '/verify-email';

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {

  List<String> otp = List.filled(4, '');
  int currentIndex = 0;

  void onNumericKeyPressed(String value) {
    if (value == 'backspace') {
      if (currentIndex > 0) {
        setState(() {
          currentIndex--;
          otp[currentIndex] = '';
        });
      }
    } else if (currentIndex < otp.length) {
      setState(() {
        otp[currentIndex] = value;
        currentIndex++;
      });
    }

    // Check if all OTP fields are filled
    if (currentIndex == otp.length) {
      String otpValue = otp.join();
      HttpService.verifyEmailCode(widget.email,otpValue,context);
      
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/img.png",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Why Verification?",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                           
                          ),
                        ).text.bold.size(32).make(),
                        Text(
                          "It ensures security and access\n             to your account.",
                          style: GoogleFonts.poppins(color: Colors.white),
                        ).text.bold.size(16).make(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.3,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  shape: BoxShape.rectangle,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Verify your email",
                        style: GoogleFonts.lato(color: Color(0xff9163D7)),
                      ).text.size(24).bold.make().p(20),
                      Text(
                        "We have sent you a code by email ",
                        style: GoogleFonts.lato(),
                      ).text.size(18).gray500.make().p(20),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Didnt you receive any code? ",
                              style: GoogleFonts.lato(),
                            ).text.gray500.make(),
                            TextButton(
                              onPressed: () async{
                                await HttpService.resendVerificationCode(widget.email,context);
                              },
                              child: const Text(
                                "Resend Code",
                                style: TextStyle(color: Color(0xff9163D7)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        // decoration: BoxDecoration(
                        //   color: Colors.white,
                        //   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Colors.grey.withOpacity(0.5),
                        //       spreadRadius: 2,
                        //       blurRadius: 5,
                        //       offset: Offset(0, 3),
                        //     ),
                        //   ],
                        // ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < otp.length; i++)
                                  buildOtpField(otp[i].isNotEmpty, otp[i]),
                              ],
                            ),
                            SizedBox(height: 20),
                            NumericKeyboard(onKeyPressed: onNumericKeyPressed),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOtpField(bool filled, String value) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: filled ? Colors.blue : Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        filled ? value : '',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class NumericKeyboard extends StatelessWidget {
  final Function(String) onKeyPressed;

  NumericKeyboard({required this.onKeyPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNumericKey("1"),
            buildNumericKey("2"),
            buildNumericKey("3"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNumericKey("4"),
            buildNumericKey("5"),
            buildNumericKey("6"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNumericKey("7"),
            buildNumericKey("8"),
            buildNumericKey("9"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildClearKey(),
            buildNumericKey("0"),
            buildBackspaceKey(),
          ],
        ),
      ],
    );
  }

  Widget buildNumericKey(String label) {
    return GestureDetector(
      onTap: () => onKeyPressed(label),
      child: Container(
        width: 90,
        height: 90,
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  Widget buildBackspaceKey() {
    return GestureDetector(
      // onTap: () => onKeyPressed("backspace"),
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget buildClearKey() {
    return GestureDetector(
      onTap: () => onKeyPressed("backspace"),
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        child: Icon(Icons.cancel),
      ),
    );
  }
}

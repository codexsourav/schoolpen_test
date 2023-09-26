import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:schoolpenintern/Providers/UserProfileProvider.dart';
import 'package:schoolpenintern/Screens/Chat/Components/ChatuserListBox.dart';
import 'package:schoolpenintern/data/Network/config.dart';
import '../../../Helper/snackBarHelper.dart';
import '../../../Theme/Colors/appcolors.dart';
import '../models/userSearchmodel.dart';

class SearchUsers extends StatefulWidget {
  final role;
  final myid;

  const SearchUsers({super.key, this.role, this.myid});

  @override
  State<SearchUsers> createState() => _SearchUsersState();
}

class _SearchUsersState extends State<SearchUsers> {
  TextEditingController _textEditingController = TextEditingController();
  UserSearchMoadel? dataMoadel;
// Search on databse  http://localhost:5000/get_profile/sourav

  Future getSearchData() async {
    try {
      http.Response data = await http.get(Uri.parse(
          "http://192.168.97.88:5000/get_profile/${_textEditingController.text}"));

      Map reddata = jsonDecode(data.body);
      if (reddata.containsKey("message")) {
        Fluttertoast.showToast(msg: "User Not Found");
        return false;
      }
      try {
        setState(() {
          dataMoadel = UserSearchMoadel.fromJson(jsonDecode(data.body));
        });
      } catch (e) {
        var snackBar = const SnackBar(content: Text('No User Found!!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      var snackBar = const SnackBar(content: Text('No User Found!!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: widget.role == "student"
                ? AppColors.purple
                : AppColors.pinkDarkcolor,
          ),
        ),
        title: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: TextFormField(
            autofocus: true,
            controller: _textEditingController,
            cursorColor: widget.role == "student"
                ? AppColors.purple
                : AppColors.pinkDarkcolor,
            onEditingComplete: () async {
              await getSearchData();
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search...",
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              filled: true,
              fillColor: AppColors.graylight,
            ),
          ),
        ),
      ),
      body: dataMoadel == null
          ? const Center(
              child: Text("Search Teachers or Students"),
            )
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 245, 245, 245),
                          Color.fromARGB(255, 245, 245, 245),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                "${Config.hostUrl}/static/${dataMoadel!.userImage}",
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dataMoadel!.username!.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    dataMoadel!.role.toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // oSendRequest(
                                //   Provider.of<UserProfileProvider>(context,
                                //           listen: false)
                                //       .dbid,
                                //   dataMoadel!.sId,
                                // );
                              },
                              child: Container(
                                width: 120,
                                height: 40,
                                child: Center(child: Text("Send Request")),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 40,
                              child: Center(child: Text("View Profile")),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ],
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

// ChatUserListBox(
//                 chatuserId: dataMoadel!.sId,
//                 imageurl: dataMoadel!.userImage,
//                 name: dataMoadel!.username,
//                 typename: dataMoadel!.role,
//                 latmessage: "",
//                 myid: "",
//               ));
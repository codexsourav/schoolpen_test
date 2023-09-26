import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:schoolpenintern/Providers/UserProfileProvider.dart';
import 'package:schoolpenintern/Screens/Chat/ChatMessage/ChatMessageScreen.dart';
import 'package:schoolpenintern/Screens/Chat/ChatMessage/bloc/chat_message_bloc.dart';
import 'package:schoolpenintern/Screens/Chat/models/userSearchmodel.dart';
import 'package:http/http.dart' as http;
import 'package:schoolpenintern/data/Network/config.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Theme/Colors/appcolors.dart';

// ignore: must_be_immutable
class ChatUserListBox extends StatefulWidget {
  String? chatuserId;

  ChatUserListBox({
    super.key,
    this.chatuserId,
  });

  @override
  State<ChatUserListBox> createState() => _ChatUserListBoxState();
}

class _ChatUserListBoxState extends State<ChatUserListBox> {
  UserSearchMoadel? dataMoadel;
  @override
  void initState() {
    getSearchData();
    super.initState();
  }

  Future getSearchData() async {
    try {
      print(widget.chatuserId);
      http.Response data = await http
          .get(Uri.parse("${Config.hostUrl}/get_profile/${widget.chatuserId}"));
      print(data.body);
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
    return Builder(builder: (context) {
      if (dataMoadel == null) {
        return SizedBox(
          width: 200.0,
          height: 100.0,
          child: Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 243, 243, 243),
              highlightColor: const Color.fromARGB(255, 241, 241, 241),
              child: const SizedBox(
                height: 30,
                width: double.infinity,
              )),
        );
      }

      return ListTile(
        splashColor: Colors.black12,
        onTap: () {
          var userData =
              Provider.of<UserProfileProvider>(context, listen: false);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return BlocProvider(
                  create: (context) => ChatMessageBloc(),
                  child: ChatMessageScreen(
                    myid: userData.dbid,
                    chatuserid: widget.chatuserId,
                    name: dataMoadel!.username,
                    roal: dataMoadel!.role,
                    image: dataMoadel!.userImage,
                  ),
                );
              },
            ),
          );
        },
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.network(
              "${Config.hostUrl}/static/${dataMoadel!.userImage}",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              dataMoadel!.username ?? "",
              style: TextStyle(
                  color: AppColors.graymdm,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            Text(" |  ${dataMoadel!.role}",
                style: TextStyle(color: AppColors.graymdm, fontSize: 14)),
          ],
        ),
        // subtitle: Padding(
        //   padding: const EdgeInsets.only(top: 5),
        //   child: Text(latmessage ?? "Hi Thsi Is Work"),
        // ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '25/02/2023',
              style: TextStyle(fontSize: 12, color: AppColors.greenlignt),
            ),
            const SizedBox(height: 5),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: AppColors.greenlignt,
                  borderRadius: BorderRadius.circular(50)),
              child: const Center(
                child: Text(
                  '1',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

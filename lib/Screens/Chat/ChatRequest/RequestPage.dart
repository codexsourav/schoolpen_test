import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:schoolpenintern/data/Network/config.dart';

import '../models/chatFriendsMoadel.dart';

class RequestPage extends StatefulWidget {
  final id;
  const RequestPage({super.key, required this.id});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  void initState() {
    getallRequest(widget.id);
    super.initState();
  }

  List<FriendRequestMoadel> requests = [];

  Future getallRequest(id) async {
    print("//////////////////////////////========================");
    print(id);
    try {
      http.Response data =
          await http.get(Uri.parse("http://192.168.97.88:7000/users/" + id));
      Map resdata = jsonDecode(data.body);
      print(resdata);
      print("===========New REQUEST===============");
      print(resdata['newrequests']);

      for (var data in resdata['newrequests']) {
        requests.add(FriendRequestMoadel.fromJson(data));
      }

      setState(() {});
      print(requests.length);
    } on HttpException catch (e) {
      Fluttertoast.showToast(msg: "Request Not Send : Error");
    }
  }

  Future accptedRequest(id) async {
    print(id);
    try {
      http.Response data = await http.get(Uri.parse(
          "http://192.168.97.88:7000/accept_friend_request/${widget.id}/$id"));
      var resdata = jsonDecode(data.body);

      print(resdata);
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: "Request Not Send : Error");
    }
  }

  Future rejectRequest(id) async {
    print(id);
    try {
      http.Response data = await http.get(Uri.parse(
          "http://192.168.97.88:7000/accept_friend_request/${widget.id}/$id"));
      var resdata = jsonDecode(data.body);
      print(resdata);
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: "Request Not Send : Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: requests.isEmpty
              ? const Center(child: Text('No Requests'))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    requests.length,
                    (index) => RequestBox(friend: requests[index]),
                  ),
                ),
        ),
      ),
    );
  }
}

class RequestBox extends StatefulWidget {
  final FriendRequestMoadel friend;
  RequestBox({super.key, required this.friend});

  @override
  State<RequestBox> createState() => _RequestBoxState();
}

class _RequestBoxState extends State<RequestBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 170, 24, 68),
            Color.fromARGB(255, 211, 182, 17)
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(data['roal']),
          //     Text("2 Days Ago"),
          //   ],
          // ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    // Config.hostUrl+"/static/"+ ??
                    "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sourav Bapari",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Sourav Bapari",
                      style: TextStyle(
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
              Container(
                width: 120,
                height: 40,
                child: Center(child: Text("Accpted")),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Container(
                width: 120,
                height: 40,
                child: Center(child: Text("Reject")),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

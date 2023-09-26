import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/ParentProfilemoadels.dart';
import 'models/StudentProfilemodels.dart';
import 'models/TeacherProfilemodels.dart';

class UserProfileProvider extends ChangeNotifier {
  String? dbid;
  String? userid;
  String? roal;
  StudentProfileModel? profileData;
  TeacherProfileModel? teacherdata;
  ParentProfileModel? parentprofile;

  setProfileData(data) {
    profileData = StudentProfileModel.fromJson(data);
    notifyListeners();
  }

  setTeacherData(data) {
    teacherdata = TeacherProfileModel.fromJson(data);
    notifyListeners();
  }

  setParentData(data) {
    parentprofile = ParentProfileModel.fromJson(data);
    notifyListeners();
  }

  userlogout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  setUSerAuthCradencials(
      {required usernameid, required useroal, required String id}) {}
}

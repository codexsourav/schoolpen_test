//  * Created by: Sourav Bapari
// Initializeapp Stup App Init
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:schoolpenintern/Screens/StartupDashBord/views/admin_user.dart';
import 'package:schoolpenintern/Screens/Teacher/home.dart';
import 'Providers/UserProfileProvider.dart';
import 'Routes/app_routes.dart';
import 'Providers/AddUsersProvider.dart';
import 'Routes/routes_names.dart';
import 'Screens/Chat/ChatHome/ChatHomeScreen.dart';
import 'Screens/Chat/ChatMessage/bloc/chat_message_bloc.dart';
import 'Screens/Parents/parent_home.dart';
import 'Theme/themedata.dart';

class Initializeapp {
  Initializeapp._();
  static initApp({startApp}) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    startApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AddUsersProvider()),
          ChangeNotifierProvider(create: (_) => UserProfileProvider()),
        ],
        child: const MyApp(),
      ),
    );
  }
}

// Start Up Material App
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      title: "AIE Intern",
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: RoutesName.splash,

      // initialRoute: RoutesName.startPage,
      home: RoleScreen(),

      // home: const ChatHomeScreen(
      //   role: "student",
      //   myid: "650d4697cb5cee705928de0a",
      //   image: "",
      // ),
      // home: BlocProvider(
      //   create: (context) => ChatMessageBloc(),
      //   child: const ChatHomeScreen(
      //     role: "teacher",
      //     myid: "650de4eda5311681ab5b6f18",
      //     image:
      //         "https://www.gravatar.com/avatar/58d540712d9ec26ec4b850a751bd171d?s=64&d=identicon&r=PG",
      //   ),
      // ),
    );
  }
}

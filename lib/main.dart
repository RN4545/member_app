import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core package
import 'package:member_app/views/help_desk/help_desk_screen.dart';
import 'package:member_app/views/home/home_screen.dart';
import 'package:member_app/views/members/members_screen.dart';
import 'package:member_app/views/notice_board/notice_board_screen.dart';
import 'package:member_app/views/visitor_management/visitor_approval_screen.dart';
import 'views/auth/login_screen.dart';
// import 'views/auth/sign_up_screen.dart';
import 'views/auth/signup_screen.dart';
import 'package:member_app/controllers/visitor_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure proper binding
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(VisitorController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyGate Clone',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/sign_up', page: () => SignUpScreen()),
        GetPage(name: '/home_screen', page: () => const HomeScreen()),
        GetPage(name: '/members', page: () => MembersScreen()),
        GetPage(name: '/notice_board', page: () => NoticeBoardScreen()),
        GetPage(name: '/help_desk', page: () => HelpDeskScreen()),
        GetPage(name: '/visitor_approval', page: () => VisitorApprovalScreen()),
      ],
    );
  }
}

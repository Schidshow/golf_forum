import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golf_forum/screens/loginPage.dart';
import 'package:golf_forum/screens/login_result.dart';

import 'package:golf_forum/screens/select_first_spot.dart';
import 'package:kakao_flutter_sdk/all.dart';

import 'screens/main_page.dart';

// void main() {
//   KakaoContext.clientId = 'c6649e448160c3635ba45fcabff93abe';
//   KakaoContext.javascriptClientId = "2b4445618caa188712cc892a3880efe5";
//   runApp(MyApp());
// }

void main() async {
  KakaoContext.clientId = 'c6649e448160c3635ba45fcabff93abe';
  KakaoContext.javascriptClientId = "2b4445618caa188712cc892a3880efe5";
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'shade',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/main', page: () => MainPage()),
        GetPage(name: '/login_result', page: () => LoginResult()),
        GetPage(name: '/selectFirstSpot', page: () => SelectFirstSpot()),
      ],
    );
  }
}

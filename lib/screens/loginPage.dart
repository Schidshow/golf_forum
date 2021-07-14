import 'package:flutter/material.dart';
import 'package:golf_forum/viewmodels/kakao_login_view_model.dart';
import 'package:kakao_flutter_sdk/all.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isKakaoTalkInstalled = false;

  @override
  void initState() {
    _initKakaoTalkInstalled();
    super.initState();
  }

  _initKakaoTalkInstalled() async {
    final installed = await isKakaoTalkInstalled();
    print('kakao Install : ' + installed.toString());

    setState(() {
      _isKakaoTalkInstalled = installed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kakao Login Test"),
        actions: [],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed:
                  KakaoLoginModule(isKakaoTalkInstalled: _isKakaoTalkInstalled)
                      .loginWithWhat,
              child: Text(" Login with talk!!!!")),
        ],
      )),
    );
  }
}
